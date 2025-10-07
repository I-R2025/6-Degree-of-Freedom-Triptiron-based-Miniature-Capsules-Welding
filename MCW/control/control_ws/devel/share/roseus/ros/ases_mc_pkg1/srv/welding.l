;; Auto-generated. Do not edit!


(when (boundp 'ases_mc_pkg1::welding)
  (if (not (find-package "ASES_MC_PKG1"))
    (make-package "ASES_MC_PKG1"))
  (shadow 'welding (find-package "ASES_MC_PKG1")))
(unless (find-package "ASES_MC_PKG1::WELDING")
  (make-package "ASES_MC_PKG1::WELDING"))
(unless (find-package "ASES_MC_PKG1::WELDINGREQUEST")
  (make-package "ASES_MC_PKG1::WELDINGREQUEST"))
(unless (find-package "ASES_MC_PKG1::WELDINGRESPONSE")
  (make-package "ASES_MC_PKG1::WELDINGRESPONSE"))

(in-package "ROS")





(defclass ases_mc_pkg1::weldingRequest
  :super ros::object
  :slots (_cmd_welding ))

(defmethod ases_mc_pkg1::weldingRequest
  (:init
   (&key
    ((:cmd_welding __cmd_welding) "")
    )
   (send-super :init)
   (setq _cmd_welding (string __cmd_welding))
   self)
  (:cmd_welding
   (&optional __cmd_welding)
   (if __cmd_welding (setq _cmd_welding __cmd_welding)) _cmd_welding)
  (:serialization-length
   ()
   (+
    ;; string _cmd_welding
    4 (length _cmd_welding)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _cmd_welding
       (write-long (length _cmd_welding) s) (princ _cmd_welding s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _cmd_welding
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _cmd_welding (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ases_mc_pkg1::weldingResponse
  :super ros::object
  :slots (_success ))

(defmethod ases_mc_pkg1::weldingResponse
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

(defclass ases_mc_pkg1::welding
  :super ros::object
  :slots ())

(setf (get ases_mc_pkg1::welding :md5sum-) "0d4d374987d43cb065ea6a57001df011")
(setf (get ases_mc_pkg1::welding :datatype-) "ases_mc_pkg1/welding")
(setf (get ases_mc_pkg1::welding :request) ases_mc_pkg1::weldingRequest)
(setf (get ases_mc_pkg1::welding :response) ases_mc_pkg1::weldingResponse)

(defmethod ases_mc_pkg1::weldingRequest
  (:response () (instance ases_mc_pkg1::weldingResponse :init)))

(setf (get ases_mc_pkg1::weldingRequest :md5sum-) "0d4d374987d43cb065ea6a57001df011")
(setf (get ases_mc_pkg1::weldingRequest :datatype-) "ases_mc_pkg1/weldingRequest")
(setf (get ases_mc_pkg1::weldingRequest :definition-)
      "string cmd_welding
---
bool success

")

(setf (get ases_mc_pkg1::weldingResponse :md5sum-) "0d4d374987d43cb065ea6a57001df011")
(setf (get ases_mc_pkg1::weldingResponse :datatype-) "ases_mc_pkg1/weldingResponse")
(setf (get ases_mc_pkg1::weldingResponse :definition-)
      "string cmd_welding
---
bool success

")



(provide :ases_mc_pkg1/welding "0d4d374987d43cb065ea6a57001df011")


