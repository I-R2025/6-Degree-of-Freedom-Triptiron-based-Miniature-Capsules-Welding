;; Auto-generated. Do not edit!


(when (boundp 'ases_mc_pkg1::grip_release)
  (if (not (find-package "ASES_MC_PKG1"))
    (make-package "ASES_MC_PKG1"))
  (shadow 'grip_release (find-package "ASES_MC_PKG1")))
(unless (find-package "ASES_MC_PKG1::GRIP_RELEASE")
  (make-package "ASES_MC_PKG1::GRIP_RELEASE"))
(unless (find-package "ASES_MC_PKG1::GRIP_RELEASEREQUEST")
  (make-package "ASES_MC_PKG1::GRIP_RELEASEREQUEST"))
(unless (find-package "ASES_MC_PKG1::GRIP_RELEASERESPONSE")
  (make-package "ASES_MC_PKG1::GRIP_RELEASERESPONSE"))

(in-package "ROS")





(defclass ases_mc_pkg1::grip_releaseRequest
  :super ros::object
  :slots (_command ))

(defmethod ases_mc_pkg1::grip_releaseRequest
  (:init
   (&key
    ((:command __command) "")
    )
   (send-super :init)
   (setq _command (string __command))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:serialization-length
   ()
   (+
    ;; string _command
    4 (length _command)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ases_mc_pkg1::grip_releaseResponse
  :super ros::object
  :slots (_success ))

(defmethod ases_mc_pkg1::grip_releaseResponse
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

(defclass ases_mc_pkg1::grip_release
  :super ros::object
  :slots ())

(setf (get ases_mc_pkg1::grip_release :md5sum-) "031d24522d462b2314fd1b6270670dd2")
(setf (get ases_mc_pkg1::grip_release :datatype-) "ases_mc_pkg1/grip_release")
(setf (get ases_mc_pkg1::grip_release :request) ases_mc_pkg1::grip_releaseRequest)
(setf (get ases_mc_pkg1::grip_release :response) ases_mc_pkg1::grip_releaseResponse)

(defmethod ases_mc_pkg1::grip_releaseRequest
  (:response () (instance ases_mc_pkg1::grip_releaseResponse :init)))

(setf (get ases_mc_pkg1::grip_releaseRequest :md5sum-) "031d24522d462b2314fd1b6270670dd2")
(setf (get ases_mc_pkg1::grip_releaseRequest :datatype-) "ases_mc_pkg1/grip_releaseRequest")
(setf (get ases_mc_pkg1::grip_releaseRequest :definition-)
      "string command
---
bool success

")

(setf (get ases_mc_pkg1::grip_releaseResponse :md5sum-) "031d24522d462b2314fd1b6270670dd2")
(setf (get ases_mc_pkg1::grip_releaseResponse :datatype-) "ases_mc_pkg1/grip_releaseResponse")
(setf (get ases_mc_pkg1::grip_releaseResponse :definition-)
      "string command
---
bool success

")



(provide :ases_mc_pkg1/grip_release "031d24522d462b2314fd1b6270670dd2")


