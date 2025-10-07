;; Auto-generated. Do not edit!


(when (boundp 'ases_mc_pkg1::status)
  (if (not (find-package "ASES_MC_PKG1"))
    (make-package "ASES_MC_PKG1"))
  (shadow 'status (find-package "ASES_MC_PKG1")))
(unless (find-package "ASES_MC_PKG1::STATUS")
  (make-package "ASES_MC_PKG1::STATUS"))

(in-package "ROS")
;;//! \htmlinclude status.msg.html


(defclass ases_mc_pkg1::status
  :super ros::object
  :slots (_Position_x _Position_y _Position_z _Position_o _Position_g _Position_r _GR_g _Current_x _Current_y _Current_z _Current_o _Current_g _Current_r ))

(defmethod ases_mc_pkg1::status
  (:init
   (&key
    ((:Position_x __Position_x) 0.0)
    ((:Position_y __Position_y) 0.0)
    ((:Position_z __Position_z) 0.0)
    ((:Position_o __Position_o) 0.0)
    ((:Position_g __Position_g) 0.0)
    ((:Position_r __Position_r) 0.0)
    ((:GR_g __GR_g) 0)
    ((:Current_x __Current_x) 0.0)
    ((:Current_y __Current_y) 0.0)
    ((:Current_z __Current_z) 0.0)
    ((:Current_o __Current_o) 0.0)
    ((:Current_g __Current_g) 0.0)
    ((:Current_r __Current_r) 0.0)
    )
   (send-super :init)
   (setq _Position_x (float __Position_x))
   (setq _Position_y (float __Position_y))
   (setq _Position_z (float __Position_z))
   (setq _Position_o (float __Position_o))
   (setq _Position_g (float __Position_g))
   (setq _Position_r (float __Position_r))
   (setq _GR_g (round __GR_g))
   (setq _Current_x (float __Current_x))
   (setq _Current_y (float __Current_y))
   (setq _Current_z (float __Current_z))
   (setq _Current_o (float __Current_o))
   (setq _Current_g (float __Current_g))
   (setq _Current_r (float __Current_r))
   self)
  (:Position_x
   (&optional __Position_x)
   (if __Position_x (setq _Position_x __Position_x)) _Position_x)
  (:Position_y
   (&optional __Position_y)
   (if __Position_y (setq _Position_y __Position_y)) _Position_y)
  (:Position_z
   (&optional __Position_z)
   (if __Position_z (setq _Position_z __Position_z)) _Position_z)
  (:Position_o
   (&optional __Position_o)
   (if __Position_o (setq _Position_o __Position_o)) _Position_o)
  (:Position_g
   (&optional __Position_g)
   (if __Position_g (setq _Position_g __Position_g)) _Position_g)
  (:Position_r
   (&optional __Position_r)
   (if __Position_r (setq _Position_r __Position_r)) _Position_r)
  (:GR_g
   (&optional __GR_g)
   (if __GR_g (setq _GR_g __GR_g)) _GR_g)
  (:Current_x
   (&optional __Current_x)
   (if __Current_x (setq _Current_x __Current_x)) _Current_x)
  (:Current_y
   (&optional __Current_y)
   (if __Current_y (setq _Current_y __Current_y)) _Current_y)
  (:Current_z
   (&optional __Current_z)
   (if __Current_z (setq _Current_z __Current_z)) _Current_z)
  (:Current_o
   (&optional __Current_o)
   (if __Current_o (setq _Current_o __Current_o)) _Current_o)
  (:Current_g
   (&optional __Current_g)
   (if __Current_g (setq _Current_g __Current_g)) _Current_g)
  (:Current_r
   (&optional __Current_r)
   (if __Current_r (setq _Current_r __Current_r)) _Current_r)
  (:serialization-length
   ()
   (+
    ;; float32 _Position_x
    4
    ;; float32 _Position_y
    4
    ;; float32 _Position_z
    4
    ;; float32 _Position_o
    4
    ;; float32 _Position_g
    4
    ;; float32 _Position_r
    4
    ;; int32 _GR_g
    4
    ;; float32 _Current_x
    4
    ;; float32 _Current_y
    4
    ;; float32 _Current_z
    4
    ;; float32 _Current_o
    4
    ;; float32 _Current_g
    4
    ;; float32 _Current_r
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _Position_x
       (sys::poke _Position_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Position_y
       (sys::poke _Position_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Position_z
       (sys::poke _Position_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Position_o
       (sys::poke _Position_o (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Position_g
       (sys::poke _Position_g (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Position_r
       (sys::poke _Position_r (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _GR_g
       (write-long _GR_g s)
     ;; float32 _Current_x
       (sys::poke _Current_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Current_y
       (sys::poke _Current_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Current_z
       (sys::poke _Current_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Current_o
       (sys::poke _Current_o (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Current_g
       (sys::poke _Current_g (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Current_r
       (sys::poke _Current_r (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _Position_x
     (setq _Position_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Position_y
     (setq _Position_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Position_z
     (setq _Position_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Position_o
     (setq _Position_o (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Position_g
     (setq _Position_g (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Position_r
     (setq _Position_r (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _GR_g
     (setq _GR_g (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _Current_x
     (setq _Current_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Current_y
     (setq _Current_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Current_z
     (setq _Current_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Current_o
     (setq _Current_o (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Current_g
     (setq _Current_g (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Current_r
     (setq _Current_r (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ases_mc_pkg1::status :md5sum-) "80a82fb24463903407d9067cb2bffe7b")
(setf (get ases_mc_pkg1::status :datatype-) "ases_mc_pkg1/status")
(setf (get ases_mc_pkg1::status :definition-)
      "float32 Position_x
float32 Position_y
float32 Position_z
float32 Position_o
float32 Position_g
float32 Position_r
int32 GR_g
float32 Current_x
float32 Current_y
float32 Current_z
float32 Current_o
float32 Current_g
float32 Current_r

")



(provide :ases_mc_pkg1/status "80a82fb24463903407d9067cb2bffe7b")


