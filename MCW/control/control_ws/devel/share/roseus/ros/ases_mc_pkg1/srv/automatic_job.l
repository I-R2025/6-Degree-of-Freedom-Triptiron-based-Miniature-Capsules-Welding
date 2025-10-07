;; Auto-generated. Do not edit!


(when (boundp 'ases_mc_pkg1::automatic_job)
  (if (not (find-package "ASES_MC_PKG1"))
    (make-package "ASES_MC_PKG1"))
  (shadow 'automatic_job (find-package "ASES_MC_PKG1")))
(unless (find-package "ASES_MC_PKG1::AUTOMATIC_JOB")
  (make-package "ASES_MC_PKG1::AUTOMATIC_JOB"))
(unless (find-package "ASES_MC_PKG1::AUTOMATIC_JOBREQUEST")
  (make-package "ASES_MC_PKG1::AUTOMATIC_JOBREQUEST"))
(unless (find-package "ASES_MC_PKG1::AUTOMATIC_JOBRESPONSE")
  (make-package "ASES_MC_PKG1::AUTOMATIC_JOBRESPONSE"))

(in-package "ROS")





(defclass ases_mc_pkg1::automatic_jobRequest
  :super ros::object
  :slots (_overlap _rpm _job ))

(defmethod ases_mc_pkg1::automatic_jobRequest
  (:init
   (&key
    ((:overlap __overlap) 0)
    ((:rpm __rpm) 0.0)
    ((:job __job) "")
    )
   (send-super :init)
   (setq _overlap (round __overlap))
   (setq _rpm (float __rpm))
   (setq _job (string __job))
   self)
  (:overlap
   (&optional __overlap)
   (if __overlap (setq _overlap __overlap)) _overlap)
  (:rpm
   (&optional __rpm)
   (if __rpm (setq _rpm __rpm)) _rpm)
  (:job
   (&optional __job)
   (if __job (setq _job __job)) _job)
  (:serialization-length
   ()
   (+
    ;; int64 _overlap
    8
    ;; float64 _rpm
    8
    ;; string _job
    4 (length _job)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _overlap
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _overlap (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _overlap) (= (length (_overlap . bv)) 2)) ;; bignum
              (write-long (ash (elt (_overlap . bv) 0) 0) s)
              (write-long (ash (elt (_overlap . bv) 1) -1) s))
             ((and (class _overlap) (= (length (_overlap . bv)) 1)) ;; big1
              (write-long (elt (_overlap . bv) 0) s)
              (write-long (if (>= _overlap 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _overlap s)(write-long (if (>= _overlap 0) 0 #xffffffff) s)))
     ;; float64 _rpm
       (sys::poke _rpm (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _job
       (write-long (length _job) s) (princ _job s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _overlap
#+(or :alpha :irix6 :x86_64)
      (setf _overlap (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _overlap (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _rpm
     (setq _rpm (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _job
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _job (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ases_mc_pkg1::automatic_jobResponse
  :super ros::object
  :slots (_success ))

(defmethod ases_mc_pkg1::automatic_jobResponse
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

(defclass ases_mc_pkg1::automatic_job
  :super ros::object
  :slots ())

(setf (get ases_mc_pkg1::automatic_job :md5sum-) "cfe80a97e30be51ef40c9219e69602d9")
(setf (get ases_mc_pkg1::automatic_job :datatype-) "ases_mc_pkg1/automatic_job")
(setf (get ases_mc_pkg1::automatic_job :request) ases_mc_pkg1::automatic_jobRequest)
(setf (get ases_mc_pkg1::automatic_job :response) ases_mc_pkg1::automatic_jobResponse)

(defmethod ases_mc_pkg1::automatic_jobRequest
  (:response () (instance ases_mc_pkg1::automatic_jobResponse :init)))

(setf (get ases_mc_pkg1::automatic_jobRequest :md5sum-) "cfe80a97e30be51ef40c9219e69602d9")
(setf (get ases_mc_pkg1::automatic_jobRequest :datatype-) "ases_mc_pkg1/automatic_jobRequest")
(setf (get ases_mc_pkg1::automatic_jobRequest :definition-)
      "int64 overlap
float64 rpm
string job
---
bool success

")

(setf (get ases_mc_pkg1::automatic_jobResponse :md5sum-) "cfe80a97e30be51ef40c9219e69602d9")
(setf (get ases_mc_pkg1::automatic_jobResponse :datatype-) "ases_mc_pkg1/automatic_jobResponse")
(setf (get ases_mc_pkg1::automatic_jobResponse :definition-)
      "int64 overlap
float64 rpm
string job
---
bool success

")



(provide :ases_mc_pkg1/automatic_job "cfe80a97e30be51ef40c9219e69602d9")


