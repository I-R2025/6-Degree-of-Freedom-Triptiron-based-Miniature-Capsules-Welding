;; Auto-generated. Do not edit!


(when (boundp 'ases_mc_pkg1::laser_control)
  (if (not (find-package "ASES_MC_PKG1"))
    (make-package "ASES_MC_PKG1"))
  (shadow 'laser_control (find-package "ASES_MC_PKG1")))
(unless (find-package "ASES_MC_PKG1::LASER_CONTROL")
  (make-package "ASES_MC_PKG1::LASER_CONTROL"))
(unless (find-package "ASES_MC_PKG1::LASER_CONTROLREQUEST")
  (make-package "ASES_MC_PKG1::LASER_CONTROLREQUEST"))
(unless (find-package "ASES_MC_PKG1::LASER_CONTROLRESPONSE")
  (make-package "ASES_MC_PKG1::LASER_CONTROLRESPONSE"))

(in-package "ROS")





(defclass ases_mc_pkg1::laser_controlRequest
  :super ros::object
  :slots (_cmd_lasercontrol ))

(defmethod ases_mc_pkg1::laser_controlRequest
  (:init
   (&key
    ((:cmd_lasercontrol __cmd_lasercontrol) "")
    )
   (send-super :init)
   (setq _cmd_lasercontrol (string __cmd_lasercontrol))
   self)
  (:cmd_lasercontrol
   (&optional __cmd_lasercontrol)
   (if __cmd_lasercontrol (setq _cmd_lasercontrol __cmd_lasercontrol)) _cmd_lasercontrol)
  (:serialization-length
   ()
   (+
    ;; string _cmd_lasercontrol
    4 (length _cmd_lasercontrol)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _cmd_lasercontrol
       (write-long (length _cmd_lasercontrol) s) (princ _cmd_lasercontrol s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _cmd_lasercontrol
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _cmd_lasercontrol (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ases_mc_pkg1::laser_controlResponse
  :super ros::object
  :slots (_success ))

(defmethod ases_mc_pkg1::laser_controlResponse
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

(defclass ases_mc_pkg1::laser_control
  :super ros::object
  :slots ())

(setf (get ases_mc_pkg1::laser_control :md5sum-) "e3f9c60fce0f55c2b7eb3a8b43ae70da")
(setf (get ases_mc_pkg1::laser_control :datatype-) "ases_mc_pkg1/laser_control")
(setf (get ases_mc_pkg1::laser_control :request) ases_mc_pkg1::laser_controlRequest)
(setf (get ases_mc_pkg1::laser_control :response) ases_mc_pkg1::laser_controlResponse)

(defmethod ases_mc_pkg1::laser_controlRequest
  (:response () (instance ases_mc_pkg1::laser_controlResponse :init)))

(setf (get ases_mc_pkg1::laser_controlRequest :md5sum-) "e3f9c60fce0f55c2b7eb3a8b43ae70da")
(setf (get ases_mc_pkg1::laser_controlRequest :datatype-) "ases_mc_pkg1/laser_controlRequest")
(setf (get ases_mc_pkg1::laser_controlRequest :definition-)
      "string cmd_lasercontrol
---
bool success

")

(setf (get ases_mc_pkg1::laser_controlResponse :md5sum-) "e3f9c60fce0f55c2b7eb3a8b43ae70da")
(setf (get ases_mc_pkg1::laser_controlResponse :datatype-) "ases_mc_pkg1/laser_controlResponse")
(setf (get ases_mc_pkg1::laser_controlResponse :definition-)
      "string cmd_lasercontrol
---
bool success

")



(provide :ases_mc_pkg1/laser_control "e3f9c60fce0f55c2b7eb3a8b43ae70da")


