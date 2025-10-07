;; Auto-generated. Do not edit!


(when (boundp 'ases_mc_pkg1::axis_motion)
  (if (not (find-package "ASES_MC_PKG1"))
    (make-package "ASES_MC_PKG1"))
  (shadow 'axis_motion (find-package "ASES_MC_PKG1")))
(unless (find-package "ASES_MC_PKG1::AXIS_MOTION")
  (make-package "ASES_MC_PKG1::AXIS_MOTION"))
(unless (find-package "ASES_MC_PKG1::AXIS_MOTIONREQUEST")
  (make-package "ASES_MC_PKG1::AXIS_MOTIONREQUEST"))
(unless (find-package "ASES_MC_PKG1::AXIS_MOTIONRESPONSE")
  (make-package "ASES_MC_PKG1::AXIS_MOTIONRESPONSE"))

(in-package "ROS")





(defclass ases_mc_pkg1::axis_motionRequest
  :super ros::object
  :slots (_Mode _position_x _position_y _position_z _position_o _position_g _position_r _velocity_x _velocity_y _velocity_z _velocity_o _velocity_g _velocity_r ))

(defmethod ases_mc_pkg1::axis_motionRequest
  (:init
   (&key
    ((:Mode __Mode) "")
    ((:position_x __position_x) 0.0)
    ((:position_y __position_y) 0.0)
    ((:position_z __position_z) 0.0)
    ((:position_o __position_o) 0.0)
    ((:position_g __position_g) 0.0)
    ((:position_r __position_r) 0.0)
    ((:velocity_x __velocity_x) 0.0)
    ((:velocity_y __velocity_y) 0.0)
    ((:velocity_z __velocity_z) 0.0)
    ((:velocity_o __velocity_o) 0.0)
    ((:velocity_g __velocity_g) 0.0)
    ((:velocity_r __velocity_r) 0.0)
    )
   (send-super :init)
   (setq _Mode (string __Mode))
   (setq _position_x (float __position_x))
   (setq _position_y (float __position_y))
   (setq _position_z (float __position_z))
   (setq _position_o (float __position_o))
   (setq _position_g (float __position_g))
   (setq _position_r (float __position_r))
   (setq _velocity_x (float __velocity_x))
   (setq _velocity_y (float __velocity_y))
   (setq _velocity_z (float __velocity_z))
   (setq _velocity_o (float __velocity_o))
   (setq _velocity_g (float __velocity_g))
   (setq _velocity_r (float __velocity_r))
   self)
  (:Mode
   (&optional __Mode)
   (if __Mode (setq _Mode __Mode)) _Mode)
  (:position_x
   (&optional __position_x)
   (if __position_x (setq _position_x __position_x)) _position_x)
  (:position_y
   (&optional __position_y)
   (if __position_y (setq _position_y __position_y)) _position_y)
  (:position_z
   (&optional __position_z)
   (if __position_z (setq _position_z __position_z)) _position_z)
  (:position_o
   (&optional __position_o)
   (if __position_o (setq _position_o __position_o)) _position_o)
  (:position_g
   (&optional __position_g)
   (if __position_g (setq _position_g __position_g)) _position_g)
  (:position_r
   (&optional __position_r)
   (if __position_r (setq _position_r __position_r)) _position_r)
  (:velocity_x
   (&optional __velocity_x)
   (if __velocity_x (setq _velocity_x __velocity_x)) _velocity_x)
  (:velocity_y
   (&optional __velocity_y)
   (if __velocity_y (setq _velocity_y __velocity_y)) _velocity_y)
  (:velocity_z
   (&optional __velocity_z)
   (if __velocity_z (setq _velocity_z __velocity_z)) _velocity_z)
  (:velocity_o
   (&optional __velocity_o)
   (if __velocity_o (setq _velocity_o __velocity_o)) _velocity_o)
  (:velocity_g
   (&optional __velocity_g)
   (if __velocity_g (setq _velocity_g __velocity_g)) _velocity_g)
  (:velocity_r
   (&optional __velocity_r)
   (if __velocity_r (setq _velocity_r __velocity_r)) _velocity_r)
  (:serialization-length
   ()
   (+
    ;; string _Mode
    4 (length _Mode)
    ;; float64 _position_x
    8
    ;; float64 _position_y
    8
    ;; float64 _position_z
    8
    ;; float64 _position_o
    8
    ;; float64 _position_g
    8
    ;; float64 _position_r
    8
    ;; float64 _velocity_x
    8
    ;; float64 _velocity_y
    8
    ;; float64 _velocity_z
    8
    ;; float64 _velocity_o
    8
    ;; float64 _velocity_g
    8
    ;; float64 _velocity_r
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _Mode
       (write-long (length _Mode) s) (princ _Mode s)
     ;; float64 _position_x
       (sys::poke _position_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_y
       (sys::poke _position_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_z
       (sys::poke _position_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_o
       (sys::poke _position_o (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_g
       (sys::poke _position_g (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_r
       (sys::poke _position_r (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_x
       (sys::poke _velocity_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_y
       (sys::poke _velocity_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_z
       (sys::poke _velocity_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_o
       (sys::poke _velocity_o (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_g
       (sys::poke _velocity_g (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_r
       (sys::poke _velocity_r (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _Mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _Mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _position_x
     (setq _position_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_y
     (setq _position_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_z
     (setq _position_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_o
     (setq _position_o (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_g
     (setq _position_g (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_r
     (setq _position_r (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_x
     (setq _velocity_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_y
     (setq _velocity_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_z
     (setq _velocity_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_o
     (setq _velocity_o (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_g
     (setq _velocity_g (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_r
     (setq _velocity_r (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass ases_mc_pkg1::axis_motionResponse
  :super ros::object
  :slots (_success ))

(defmethod ases_mc_pkg1::axis_motionResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass ases_mc_pkg1::axis_motion
  :super ros::object
  :slots ())

(setf (get ases_mc_pkg1::axis_motion :md5sum-) "c335753bd65b2110697b8c82c9ecf78e")
(setf (get ases_mc_pkg1::axis_motion :datatype-) "ases_mc_pkg1/axis_motion")
(setf (get ases_mc_pkg1::axis_motion :request) ases_mc_pkg1::axis_motionRequest)
(setf (get ases_mc_pkg1::axis_motion :response) ases_mc_pkg1::axis_motionResponse)

(defmethod ases_mc_pkg1::axis_motionRequest
  (:response () (instance ases_mc_pkg1::axis_motionResponse :init)))

(setf (get ases_mc_pkg1::axis_motionRequest :md5sum-) "c335753bd65b2110697b8c82c9ecf78e")
(setf (get ases_mc_pkg1::axis_motionRequest :datatype-) "ases_mc_pkg1/axis_motionRequest")
(setf (get ases_mc_pkg1::axis_motionRequest :definition-)
      "string Mode
float64 position_x
float64 position_y
float64 position_z
float64 position_o
float64 position_g
float64 position_r
float64 velocity_x
float64 velocity_y
float64 velocity_z
float64 velocity_o
float64 velocity_g
float64 velocity_r
---
bool success

")

(setf (get ases_mc_pkg1::axis_motionResponse :md5sum-) "c335753bd65b2110697b8c82c9ecf78e")
(setf (get ases_mc_pkg1::axis_motionResponse :datatype-) "ases_mc_pkg1/axis_motionResponse")
(setf (get ases_mc_pkg1::axis_motionResponse :definition-)
      "string Mode
float64 position_x
float64 position_y
float64 position_z
float64 position_o
float64 position_g
float64 position_r
float64 velocity_x
float64 velocity_y
float64 velocity_z
float64 velocity_o
float64 velocity_g
float64 velocity_r
---
bool success

")



(provide :ases_mc_pkg1/axis_motion "c335753bd65b2110697b8c82c9ecf78e")


