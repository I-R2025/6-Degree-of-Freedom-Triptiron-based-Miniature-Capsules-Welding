;; Auto-generated. Do not edit!


(when (boundp 'ases_mc_pkg1::state)
  (if (not (find-package "ASES_MC_PKG1"))
    (make-package "ASES_MC_PKG1"))
  (shadow 'state (find-package "ASES_MC_PKG1")))
(unless (find-package "ASES_MC_PKG1::STATE")
  (make-package "ASES_MC_PKG1::STATE"))

(in-package "ROS")
;;//! \htmlinclude state.msg.html


(defclass ases_mc_pkg1::state
  :super ros::object
  :slots (_x _y _z _o _g _r ))

(defmethod ases_mc_pkg1::state
  (:init
   (&key
    ((:x __x) nil)
    ((:y __y) nil)
    ((:z __z) nil)
    ((:o __o) nil)
    ((:g __g) nil)
    ((:r __r) nil)
    )
   (send-super :init)
   (setq _x __x)
   (setq _y __y)
   (setq _z __z)
   (setq _o __o)
   (setq _g __g)
   (setq _r __r)
   self)
  (:x
   (&optional (__x :null))
   (if (not (eq __x :null)) (setq _x __x)) _x)
  (:y
   (&optional (__y :null))
   (if (not (eq __y :null)) (setq _y __y)) _y)
  (:z
   (&optional (__z :null))
   (if (not (eq __z :null)) (setq _z __z)) _z)
  (:o
   (&optional (__o :null))
   (if (not (eq __o :null)) (setq _o __o)) _o)
  (:g
   (&optional (__g :null))
   (if (not (eq __g :null)) (setq _g __g)) _g)
  (:r
   (&optional (__r :null))
   (if (not (eq __r :null)) (setq _r __r)) _r)
  (:serialization-length
   ()
   (+
    ;; bool _x
    1
    ;; bool _y
    1
    ;; bool _z
    1
    ;; bool _o
    1
    ;; bool _g
    1
    ;; bool _r
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _x
       (if _x (write-byte -1 s) (write-byte 0 s))
     ;; bool _y
       (if _y (write-byte -1 s) (write-byte 0 s))
     ;; bool _z
       (if _z (write-byte -1 s) (write-byte 0 s))
     ;; bool _o
       (if _o (write-byte -1 s) (write-byte 0 s))
     ;; bool _g
       (if _g (write-byte -1 s) (write-byte 0 s))
     ;; bool _r
       (if _r (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _x
     (setq _x (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _y
     (setq _y (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _z
     (setq _z (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _o
     (setq _o (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _g
     (setq _g (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _r
     (setq _r (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ases_mc_pkg1::state :md5sum-) "550bf2d382d07f1819d62fc2dab7258e")
(setf (get ases_mc_pkg1::state :datatype-) "ases_mc_pkg1/state")
(setf (get ases_mc_pkg1::state :definition-)
      "bool x
bool y
bool z
bool o
bool g
bool r

")



(provide :ases_mc_pkg1/state "550bf2d382d07f1819d62fc2dab7258e")


