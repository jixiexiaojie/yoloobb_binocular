;; Auto-generated. Do not edit!


(when (boundp 'rs_yolov8::Info)
  (if (not (find-package "RS_YOLOV8"))
    (make-package "RS_YOLOV8"))
  (shadow 'Info (find-package "RS_YOLOV8")))
(unless (find-package "RS_YOLOV8::INFO")
  (make-package "RS_YOLOV8::INFO"))

(in-package "ROS")
;;//! \htmlinclude Info.msg.html


(defclass rs_yolov8::Info
  :super ros::object
  :slots (_x _y _z _angle _classification _confidence ))

(defmethod rs_yolov8::Info
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:angle __angle) 0.0)
    ((:classification __classification) "")
    ((:confidence __confidence) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _angle (float __angle))
   (setq _classification (string __classification))
   (setq _confidence (float __confidence))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:classification
   (&optional __classification)
   (if __classification (setq _classification __classification)) _classification)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _angle
    8
    ;; string _classification
    4 (length _classification)
    ;; float64 _confidence
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _classification
       (write-long (length _classification) s) (princ _classification s)
     ;; float64 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _classification
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _classification (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _confidence
     (setq _confidence (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get rs_yolov8::Info :md5sum-) "1c0cd277fce00eb84b787e9914662978")
(setf (get rs_yolov8::Info :datatype-) "rs_yolov8/Info")
(setf (get rs_yolov8::Info :definition-)
      "float64 x
float64 y
float64 z
float64 angle
string classification
float64 confidence
")



(provide :rs_yolov8/Info "1c0cd277fce00eb84b787e9914662978")


