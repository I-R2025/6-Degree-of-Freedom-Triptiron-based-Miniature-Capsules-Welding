;; Auto-generated. Do not edit!


(when (boundp 'ases_mc_pkg1::parking)
  (if (not (find-package "ASES_MC_PKG1"))
    (make-package "ASES_MC_PKG1"))
  (shadow 'parking (find-package "ASES_MC_PKG1")))
(unless (find-package "ASES_MC_PKG1::PARKING")
  (make-package "ASES_MC_PKG1::PARKING"))
(unless (find-package "ASES_MC_PKG1::PARKINGREQUEST")
  (make-package "ASES_MC_PKG1::PARKINGREQUEST"))
(unless (find-package "ASES_MC_PKG1::PARKINGRESPONSE")
  (make-package "ASES_MC_PKG1::PARKINGRESPONSE"))

(in-package "ROS")





(defclass ases_mc_pkg1::parkingRequest
  :super ros::object
  :slots (_start ))

(defmethod ases_mc_pkg1::parkingRequest
  (:init
   (&key
    ((:start __start) nil)
    )
   (send-super :init)
   (setq _start __start)
   self)
  (:start
   (&optional (__start :null))
   (if (not (eq __start :null)) (setq _start __start)) _start)
  (:serialization-length
   ()
   (+
    ;; bool _start
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _start
       (if _start (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _start
     (setq _start (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass ases_mc_pkg1::parkingResponse
  :super ros::object
  :slots (_success ))

(defmethod ases_mc_pkg1::parkingResponse
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

(defclass ases_mc_pkg1::parking
  :super ros::object
  :slots ())

(setf (get ases_mc_pkg1::parking :md5sum-) "bbb7ba84302b6f35af5466a95cd7ac90")
(setf (get ases_mc_pkg1::parking :datatype-) "ases_mc_pkg1/parking")
(setf (get ases_mc_pkg1::parking :request) ases_mc_pkg1::parkingRequest)
(setf (get ases_mc_pkg1::parking :response) ases_mc_pkg1::parkingResponse)

(defmethod ases_mc_pkg1::parkingRequest
  (:response () (instance ases_mc_pkg1::parkingResponse :init)))

(setf (get ases_mc_pkg1::parkingRequest :md5sum-) "bbb7ba84302b6f35af5466a95cd7ac90")
(setf (get ases_mc_pkg1::parkingRequest :datatype-) "ases_mc_pkg1/parkingRequest")
(setf (get ases_mc_pkg1::parkingRequest :definition-)
      "bool start
---
bool success
")

(setf (get ases_mc_pkg1::parkingResponse :md5sum-) "bbb7ba84302b6f35af5466a95cd7ac90")
(setf (get ases_mc_pkg1::parkingResponse :datatype-) "ases_mc_pkg1/parkingResponse")
(setf (get ases_mc_pkg1::parkingResponse :definition-)
      "bool start
---
bool success
")



(provide :ases_mc_pkg1/parking "bbb7ba84302b6f35af5466a95cd7ac90")


