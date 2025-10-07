;; Auto-generated. Do not edit!


(when (boundp 'ases_mc_pkg1::trajectory)
  (if (not (find-package "ASES_MC_PKG1"))
    (make-package "ASES_MC_PKG1"))
  (shadow 'trajectory (find-package "ASES_MC_PKG1")))
(unless (find-package "ASES_MC_PKG1::TRAJECTORY")
  (make-package "ASES_MC_PKG1::TRAJECTORY"))
(unless (find-package "ASES_MC_PKG1::TRAJECTORYREQUEST")
  (make-package "ASES_MC_PKG1::TRAJECTORYREQUEST"))
(unless (find-package "ASES_MC_PKG1::TRAJECTORYRESPONSE")
  (make-package "ASES_MC_PKG1::TRAJECTORYRESPONSE"))

(in-package "ROS")





(defclass ases_mc_pkg1::trajectoryRequest
  :super ros::object
  :slots (_trajectory_axis ))

(defmethod ases_mc_pkg1::trajectoryRequest
  (:init
   (&key
    ((:trajectory_axis __trajectory_axis) "")
    )
   (send-super :init)
   (setq _trajectory_axis (string __trajectory_axis))
   self)
  (:trajectory_axis
   (&optional __trajectory_axis)
   (if __trajectory_axis (setq _trajectory_axis __trajectory_axis)) _trajectory_axis)
  (:serialization-length
   ()
   (+
    ;; string _trajectory_axis
    4 (length _trajectory_axis)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _trajectory_axis
       (write-long (length _trajectory_axis) s) (princ _trajectory_axis s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _trajectory_axis
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _trajectory_axis (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ases_mc_pkg1::trajectoryResponse
  :super ros::object
  :slots (_success ))

(defmethod ases_mc_pkg1::trajectoryResponse
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

(defclass ases_mc_pkg1::trajectory
  :super ros::object
  :slots ())

(setf (get ases_mc_pkg1::trajectory :md5sum-) "a07f1b0bb7ff82b3417aae6f2a566229")
(setf (get ases_mc_pkg1::trajectory :datatype-) "ases_mc_pkg1/trajectory")
(setf (get ases_mc_pkg1::trajectory :request) ases_mc_pkg1::trajectoryRequest)
(setf (get ases_mc_pkg1::trajectory :response) ases_mc_pkg1::trajectoryResponse)

(defmethod ases_mc_pkg1::trajectoryRequest
  (:response () (instance ases_mc_pkg1::trajectoryResponse :init)))

(setf (get ases_mc_pkg1::trajectoryRequest :md5sum-) "a07f1b0bb7ff82b3417aae6f2a566229")
(setf (get ases_mc_pkg1::trajectoryRequest :datatype-) "ases_mc_pkg1/trajectoryRequest")
(setf (get ases_mc_pkg1::trajectoryRequest :definition-)
      "string trajectory_axis
---
bool success
")

(setf (get ases_mc_pkg1::trajectoryResponse :md5sum-) "a07f1b0bb7ff82b3417aae6f2a566229")
(setf (get ases_mc_pkg1::trajectoryResponse :datatype-) "ases_mc_pkg1/trajectoryResponse")
(setf (get ases_mc_pkg1::trajectoryResponse :definition-)
      "string trajectory_axis
---
bool success
")



(provide :ases_mc_pkg1/trajectory "a07f1b0bb7ff82b3417aae6f2a566229")


