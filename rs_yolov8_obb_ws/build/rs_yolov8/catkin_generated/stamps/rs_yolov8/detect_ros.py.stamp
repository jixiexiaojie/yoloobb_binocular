#! /usr/bin/env python3

import os
import cv2
import sys
import yaml
import time
import math
import torch
import rospy
import roslib

import numpy as np
import pyrealsense2 as rs
from random import randint

from pathlib import Path
from collections import deque
from rs_yolov8.msg import Info
from std_msgs.msg import String
from std_msgs.msg import Header
from geometry_msgs.msg import Point
import torch.backends.cudnn as cudnn
sys.path.remove('/opt/ros/melodic/lib/python2.7/dist-packages')

from models.common import DetectMultiBackend
from utils.datasets import IMG_FORMATS, VID_FORMATS, LoadImages, LoadStreams, letterbox
from utils.general import (LOGGER, check_file, check_img_size, check_imshow, 
                            check_requirements, colorstr, set_logging, increment_path, 
                            non_max_suppression, non_max_suppression_obb, print_args, 
                            scale_coords, scale_polys, strip_optimizer, xyxy2xywh)

from utils.rboxs_utils import poly2rbox, rbox2poly
from utils.torch_utils import select_device, time_sync
from utils.plots import Annotator, colors, save_one_box

pipeline = rs.pipeline()  # 定义流程pipeline
config = rs.config()  # 定义配置config

config.enable_stream(rs.stream.depth, 1280, 720, rs.format.z16, 30)
config.enable_stream(rs.stream.color, 1280, 720, rs.format.bgr8, 30)
profile = pipeline.start(config)  # 流程开始

device = profile.get_device()
device.hardware_reset()

align_to = rs.stream.color  # 与color流对齐
align = rs.align(align_to)

def get_aligned_images():
    frames = pipeline.wait_for_frames()  # 等待获取图像帧
    aligned_frames = align.process(frames)  # 获取对齐帧
    aligned_depth_frame = aligned_frames.get_depth_frame()  # 获取对齐帧中的depth帧
    color_frame = aligned_frames.get_color_frame()  # 获取对齐帧中的color帧

    ############### 相机参数的获取 ##########################
    intr = color_frame.profile.as_video_stream_profile().intrinsics  # 获取相机内参
    depth_intrin = aligned_depth_frame.profile.as_video_stream_profile().intrinsics  # 获取深度参数（像素坐标系转相机坐标系会用到）
    '''camera_parameters = {'fx': intr.fx, 'fy': intr.fy,
                        'ppx': intr.ppx, 'ppy': intr.ppy,
                        'height': intr.height, 'width': intr.width,
                        'depth_scale': profile.get_device().first_depth_sensor().get_depth_scale()
                        }'''

    #######################################################
    depth_image = np.asanyarray(aligned_depth_frame.get_data())                            # 深度图（默认16位）
    depth_image_8bit = cv2.convertScaleAbs(depth_image, alpha=0.03)                        # 深度图（8位）
    depth_image_3d = np.dstack((depth_image_8bit, depth_image_8bit, depth_image_8bit))     # 3通道深度图
    color_image = np.asanyarray(color_frame.get_data())                                    # RGB图
    # 返回相机内参、深度参数、彩色图、深度图、齐帧中的depth帧
    return intr, depth_intrin, color_image, depth_image, aligned_depth_frame

class YoloV8:
    def __init__(self, yolov8_yaml_path='./config/yolov8obb_demo.yaml'):
        #载入配置文件
        with open(yolov8_yaml_path, 'r', encoding='utf-8') as f:
            self.yolov8 = yaml.load(f.read(), Loader=yaml.SafeLoader)
        #随机生成每个类别的颜色
        self.colors = [[randint(0, 255) for _ in range(3)] for class_id in range(self.yolov8['nc'])]
        #模型初始化
        self.init_model()
    
    @torch.no_grad()
    def init_model(self):
        #设置日志输出
        set_logging()
        #选择计算单元
        device = select_device(self.yolov8['device'])
        #如果使用GPU则使用半浮点数F16
        # is_half = device.type != 'cpu'
        is_half = False
        #载入模型
        # device='cpu'
        model = DetectMultiBackend(self.yolov8['weight'], device=device, dnn=False)
        stride, self.names, pt, jit, onnx, engine = model.stride, model.names, model.pt, model.jit, model.onnx, model.engine
        input_size = check_img_size(self.yolov8['input_size'], s=stride)
        # 设置BenchMark，加速固定图像的尺寸的推理
        cudnn.benchmark = True  # set True to speed up constant image size inference
        
        is_half &= (pt or jit or engine) and device.type != 'cpu'
        if pt or jit:
            model.model.half() if is_half else model.model.float()

        # 图像缓冲区初始化
        img_torch = torch.zeros((1, 3, self.yolov8['input_size'], self.yolov8['input_size']), device=device)  # init img
        # 创建模型
        # run once
        new_img = [self.yolov8['input_size'], self.yolov8['input_size']]
        model.warmup(imgsz=(1, 3, *new_img), half=is_half)
        # _ = model(img_torch.half())
        # if is_half else img) if device.type != 'cpu' else None
        self.is_half      = is_half      # 是否开启半精度
        self.device       = device        # 计算设备
        self.model        = model          # Yolov5模型
        self.img_torch    = img_torch  # 图像缓冲区
        self.classes      = None
        self.max_det      = 1000
        self.agnostic_nms = False
        self.names        = ""
        self.hide_labels  = False
        self.hide_conf    = False
        self.line_thickness = None

    def preprocessing(self, img):
        '''图像预处理'''
        # 图像缩放
        # 注: auto一定要设置为False -> 图像的宽高不同
        img_resize = letterbox(img, new_shape=(self.yolov8['input_size'], self.yolov8['input_size']), auto=False)[0]
        # 增加一个维度
        img_arr = np.stack([img_resize], 0)
        # 图像转换 (Convert) BGR格式转换为RGB
        # 转换为 bs x 3 x 416 x
        # 0(图像i), 1(row行), 2(列), 3(RGB三通道)
        # ---> 0, 3, 1, 2
        # BGR to RGB, to bsx3x416x416
        img_arr = img_arr[:, :, :, ::-1].transpose(0, 3, 1, 2)
        # 数值归一化
        # img_arr =  img_arr.astype(np.float32) / 255.0
        # 将数组在内存的存放地址变成连续的(一维)， 行优先
        # 将一个内存不连续存储的数组转换为内存连续存储的数组，使得运行速度更快
        img_arr = np.ascontiguousarray(img_arr)
        return img_arr

    @torch.no_grad()
    def detect(self, img, canvas=None):
        """模型预测"""
        #图像预处理
        img_resize = self.preprocessing(img)
        self.img_torch = torch.from_numpy(img_resize).to(self.device)                       # 图像格式转换
        self.img_torch = self.img_torch.half() if self.is_half else self.img_torch.float()  # uint8 to fp16/32
        self.img_torch /= 255.0                                                             # 0 - 255 to 0.0 - 1.0
        
        if len(self.img_torch.shape) == 3:
            self.img_torch = self.img_torch[None]                                           # expand for batch dim

        # 模型推理
        t_start = time_sync()
        pred = self.model(self.img_torch, augment=False)
        # NMS 非极大值抑制
        pred = non_max_suppression_obb(pred, self.yolov8['threshold']['confidence'], self.yolov8['threshold']['iou'], 
                                             self.classes, self.agnostic_nms, multi_label=True, max_det=self.max_det)
        t_end = time_sync()
        
        if canvas is None:
            canvas = np.copy(img)

        tl = self.line_thickness or round(0.002 * (img.shape[0] + img.shape[1]) / 2) + 1  # line/font thickness
        
        xyxy_list     = []
        conf_list     = []
        class_id_list = []
        angle_list    = []
        for i, det in enumerate(pred):  # per image
            annotator = Annotator(canvas, line_width=self.line_thickness, example=str(self.names))
            pred_poly = rbox2poly(det[:, :5]) # (n, [x1 y1 x2 y2 x3 y3 x4 y4])
            
            if det is not None and len(det):
                pred_poly = scale_polys(img_resize.shape[2:], pred_poly, canvas.shape)
                det = torch.cat((pred_poly, det[:, -2:]), dim=1)      # (n, [poly conf cls])
                # Write results
                for *poly, conf, cls in reversed(det):
                    print("poly: ", *poly)
                    # print('conf:', conf.item())
                    # print('cls:', cls.item())
                    # Add poly to image
                    class_id = int(cls)   # integer class
                    conf_list.append(conf)
                    class_id_list.append(class_id)
                    # label = None if self.hide_labels else (self.names[c] if self.hide_conf else f'{self.names[c]} {conf:.2f}')
                    annotator.poly_label(poly, "result", color=colors(class_id, True))
                
                try:
                    preds_poly = pred_poly.tolist()[i]
                    preds_poly = np.array(preds_poly)
                    preds_poly = np.float32(preds_poly.reshape(4,2))
                    (x, y), (w, h), angle = cv2.minAreaRect(preds_poly)
                    angle = -angle
                    theta = angle * np.pi / 180
                    angle_list.append(theta)
                    xyxy_list.append([x, y])
                    print("x: ", x)
                    print("y: ", y )
                    print("theta is: ", theta)

                except IndexError:
                    print("detect result is null!")

            else:
                print("no detect result!")
        return canvas, class_id_list, xyxy_list, conf_list, angle_list

class YoloV8Detection:
    def __init__(self):
        config_path = self.init_ros()
        return self.init_detect(config_path)
    
    def init_ros(self):
        config_path = rospy.get_param("/config_path", "./src/rs_yolov8/scripts/config/yolov8obb_demo.yaml")
        return config_path
    
    def init_detect(self, config_path):
        print("[INFO] 开始YoloV8模型加载")
        model = YoloV8(yolov8_yaml_path=config_path)
        print("[INFO] 完成YoloV8模型加载")
        return self.model_detect(model)

    def model_detect(self, model):
        while True:
            # Wait for a coherent pair of frames: depth and color
            intr, depth_intrin, color_image, depth_image, aligned_depth_frame = get_aligned_images()  # 获取对齐的图像与相机内参
            if not depth_image.any() or not color_image.any():
                continue
            # Convert images to numpy arrays
            # Apply colormap on depth image (image must be converted to 8-bit per pixel first)
            depth_colormap = cv2.applyColorMap(cv2.convertScaleAbs(depth_image, alpha=0.03), cv2.COLORMAP_JET)
            # Stack both images horizontally
            images = np.hstack((color_image, depth_colormap))
            # Show images
            t_start = time.time()  # 开始计时
            # YoloV5 目标检测
            # canvas = model.detect(color_image)
            canvas, class_id_list, xyxy_list, conf_list, angle_list = model.detect(color_image)
            t_end = time.time()  # 结束计时

            camera_xyz_list = []
            if xyxy_list:
                for i in range(len(xyxy_list)):
                    # ux = int((xyxy_list[i][0]+xyxy_list[i][2])/2)  # 计算像素坐标系的x
                    # uy = int((xyxy_list[i][1]+xyxy_list[i][3])/2)  # 计算像素坐标系的y
                    ux = int(xyxy_list[i][0])  # 计算像素坐标系的x
                    uy = int(xyxy_list[i][1])  # 计算像素坐标系的y
                    dis = aligned_depth_frame.get_distance(ux, uy)
                    center = (ux, uy)
                    camera_xyz = rs.rs2_deproject_pixel_to_point(depth_intrin, center, dis)  # 计算相机坐标系的xyz
                    camera_xyz = np.round(np.array(camera_xyz), 3)                  # 转成3位小数
                    camera_xyz = camera_xyz.tolist()
                    cv2.circle(canvas, (ux,uy), 4, (255, 255, 255), 5)              # 标出中心点
                    cv2.putText(canvas, str(camera_xyz), (ux+20, uy+10), 0, 1, [225, 255, 255], thickness=2, lineType=cv2.LINE_AA) #标出坐标
                    camera_xyz_list.append(camera_xyz)
            for i in range(len(camera_xyz_list)):
                self.publish_image(camera_xyz_list[i][0], camera_xyz_list[i][1], camera_xyz_list[i][2], angle_list[i], model.yolov8['names'][class_id_list[i]], conf_list[i])
                #publish_image(camera_xyz_list[i][0], camera_xyz_list[i][1], camera_xyz_list[i][2])

            # 添加fps显示
            fps = int(1.0 / (t_end - t_start))
            cv2.putText(canvas, text="FPS: {}".format(fps), org=(50, 50), fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1, thickness=2, lineType=cv2.LINE_AA, color=(0, 0, 0))
            cv2.namedWindow('detection', flags=cv2.WINDOW_NORMAL | cv2.WINDOW_KEEPRATIO | cv2.WINDOW_GUI_EXPANDED)
            cv2.imshow("detection", canvas)
            key = cv2.waitKey(1)  # 1 millisecond
            if key & 0xFF == ord('q') or key == 27:
                cv2.destroyAllWindows()
                break

    def publish_image(self, real_x, real_y, real_z, real_angle, classification, confidence):
        detect_result=Info()
        rate = rospy.Rate(30)
        header = Header(stamp=rospy.Time.now())
        header.frame_id = 'map'

        detect_result.x = real_x
        detect_result.y = real_y
        detect_result.z = real_z
        detect_result.angle = real_angle

        detect_result.classification = classification
        detect_result.confidence = confidence

        pub.publish(detect_result)
        rate.sleep()                                        


if __name__ == "__main__":
    print("[INFO] YoloV8目标检测-程序启动")
    global sec
    rospy.init_node('ros_yolo')
    pub = rospy.Publisher("/detect_result_out", Info, queue_size=10)
    sec = YoloV8Detection()

    try: 
        rospy.spin()
    except KeyboardInterrupt:
        del sec
        pipeline.stop()
        print("Shutting down")