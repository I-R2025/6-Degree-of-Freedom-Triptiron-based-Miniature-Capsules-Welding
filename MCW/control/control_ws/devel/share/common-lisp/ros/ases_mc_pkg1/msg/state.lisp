; Auto-generated. Do not edit!


(cl:in-package ases_mc_pkg1-msg)


;//! \htmlinclude state.msg.html

(cl:defclass <state> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:boolean
    :initform cl:nil)
   (y
    :reader y
    :initarg :y
    :type cl:boolean
    :initform cl:nil)
   (z
    :reader z
    :initarg :z
    :type cl:boolean
    :initform cl:nil)
   (o
    :reader o
    :initarg :o
    :type cl:boolean
    :initform cl:nil)
   (g
    :reader g
    :initarg :g
    :type cl:boolean
    :initform cl:nil)
   (r
    :reader r
    :initarg :r
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass state (<state>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <state>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'state)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ases_mc_pkg1-msg:<state> is deprecated: use ases_mc_pkg1-msg:state instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-msg:x-val is deprecated.  Use ases_mc_pkg1-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-msg:y-val is deprecated.  Use ases_mc_pkg1-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-msg:z-val is deprecated.  Use ases_mc_pkg1-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'o-val :lambda-list '(m))
(cl:defmethod o-val ((m <state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-msg:o-val is deprecated.  Use ases_mc_pkg1-msg:o instead.")
  (o m))

(cl:ensure-generic-function 'g-val :lambda-list '(m))
(cl:defmethod g-val ((m <state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-msg:g-val is deprecated.  Use ases_mc_pkg1-msg:g instead.")
  (g m))

(cl:ensure-generic-function 'r-val :lambda-list '(m))
(cl:defmethod r-val ((m <state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-msg:r-val is deprecated.  Use ases_mc_pkg1-msg:r instead.")
  (r m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <state>) ostream)
  "Serializes a message object of type '<state>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'x) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'y) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'z) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'o) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'g) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'r) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <state>) istream)
  "Deserializes a message object of type '<state>"
    (cl:setf (cl:slot-value msg 'x) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'y) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'z) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'o) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'g) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'r) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<state>)))
  "Returns string type for a message object of type '<state>"
  "ases_mc_pkg1/state")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'state)))
  "Returns string type for a message object of type 'state"
  "ases_mc_pkg1/state")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<state>)))
  "Returns md5sum for a message object of type '<state>"
  "550bf2d382d07f1819d62fc2dab7258e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'state)))
  "Returns md5sum for a message object of type 'state"
  "550bf2d382d07f1819d62fc2dab7258e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<state>)))
  "Returns full string definition for message of type '<state>"
  (cl:format cl:nil "bool x~%bool y~%bool z~%bool o~%bool g~%bool r~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'state)))
  "Returns full string definition for message of type 'state"
  (cl:format cl:nil "bool x~%bool y~%bool z~%bool o~%bool g~%bool r~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <state>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <state>))
  "Converts a ROS message object to a list"
  (cl:list 'state
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':o (o msg))
    (cl:cons ':g (g msg))
    (cl:cons ':r (r msg))
))
