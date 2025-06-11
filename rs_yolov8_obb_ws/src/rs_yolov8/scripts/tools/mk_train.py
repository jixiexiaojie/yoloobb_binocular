import os 
import argparse


def make_dataset(opt):
    data_path=opt.data_path
    with open(data_path+'/train.txt','w') as f:
        for filename in os.listdir(data_path):
            data_file_path=data_path+'/'+filename
            if os.path.isdir(data_file_path):
                for filename1 in os.listdir(data_file_path):
                    # print("file_name1:", filename1)
                    # if filename1=='images':
                    #     path2=data_file_path+'/'+filename1
                    #     for filename2 in os.listdir(path2):
                    #         path3=path2+'/'+filename2
                    if filename1=='train':
                        path2=data_file_path+'/'+filename1
                        for filename2 in os.listdir(path2):
                            f.write(path2+'/'+filename2+'\n')

    with open(data_path+'/val.txt','w') as f:
        for filename in os.listdir(data_path):
            data_file_path=data_path+'/'+filename
            if os.path.isdir(data_file_path):
                for filename1 in os.listdir(data_file_path):
                    # if filename1=='images':
                    #     path2=data_file_path+'/'+filename1
                    #     for filename2 in os.listdir(path2):
                    #         path3=path2+'/'+filename2
                    if filename1=='val':
                        path2=data_file_path+'/'+filename1
                        for filename2 in os.listdir(path2):
                            f.write(path2+'/'+filename2+'\n')


def parse_opt(known=False):
    parser = argparse.ArgumentParser()
    parser.add_argument('--data_path', type=str, default="/home/lenovo/Downloads/2Ddetection/Yolov8_obb_Prune_Track-main/data/custom_data")

    opt = parser.parse_known_args()[0] if known else parser.parse_args()
    return opt


if __name__ == "__main__":

    opt = parse_opt()
    make_dataset(opt)
