;; Auto-generated. Do not edit!


(when (boundp 'ases_mc_pkg1::homing_axis_srv)
  (if (not (find-package "ASES_MC_PKG1"))
    (make-package "ASES_MC_PKG1"))
  (shadow 'homing_axis_srv (find-package "ASES_MC_PKG1")))
(unless (find-package "ASES_MC_PKG1::HOMING_AXIS_SRV")
  (make-package "ASES_MC_PKG1::HOMING_AXIS_SRV"))
(unless (find-package "ASES_MC_PKG1::HOMING_AXIS_SRVREQUEST")
  (make-package "ASES_MC_PKG1::HOMING_AXIS_SRVREQUEST"))
(unless (find-package "ASES_MC_PKG1::HOMING_AXIS_SRVRESPONSE")
  (make-package "ASES_MC_PKG1::HOMING_AXIS_SRVRESPONSE"))

(in-package "ROS")





(defclass ases_mc_pkg1::homing_axis_srvRequest
  :super ros::object
  :slots ())

(defmethod ases_mc_pkg1::homing_axis_srvRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass ases_mc_pkg1::homing_axis_srvResponse
  :super ros::object
  :slots (_success ))

(defmethod ases_mc_pkg1::homing_axis_srvResponse
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

(defclass ases_mc_pkg1::homing_axis_srv
  :super ros::object
  :slots ())

(setf (get ases_mc_pkg1::homing_axis_srv :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get ases_mc_pkg1::homing_axis_srv :datatype-) "ases_mc_pkg1/homing_axis_srv")
(setf (get ases_mc_pkg1::homing_axis_srv :request) ases_mc_pkg1::homing_axis_srvRequest)
(setf (get ases_mc_pkg1::homing_axis_srv :response) ases_mc_pkg1::homing_axis_srvResponse)

(defmethod ases_mc_pkg1::homing_axis_srvRequest
  (:response () (instance ases_mc_pkg1::homing_axis_srvResponse :init)))

(setf (get ases_mc_pkg1::homing_axis_srvRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get ases_mc_pkg1::homing_axis_srvRequest :datatype-) "ases_mc_pkg1/homing_axis_srvRequest")
(setf (get ases_mc_pkg1::homing_axis_srvRequest :definition-)
      "---
bool success

")

(setf (get ases_mc_pkg1::homing_axis_srvResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get ases_mc_pkg1::homing_axis_srvResponse :datatype-) "ases_mc_pkg1/homing_axis_srvResponse")
(setf (get ases_mc_pkg1::homing_axis_srvResponse :definition-)
      "---
bool success

")



(provide :ases_mc_pkg1/homing_axis_srv "358e233cde0c8a8bcfea4ce193f8fc15")


