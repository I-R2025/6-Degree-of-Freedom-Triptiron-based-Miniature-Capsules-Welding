; Auto-generated. Do not edit!


(cl:in-package ases_mc_pkg1-srv)


;//! \htmlinclude laser_control-request.msg.html

(cl:defclass <laser_control-request> (roslisp-msg-protocol:ros-message)
  ((cmd_lasercontrol
    :reader cmd_lasercontrol
    :initarg :cmd_lasercontrol
    :type cl:string
    :initform ""))
)

(cl:defclass laser_control-request (<laser_control-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <laser_control-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'laser_control-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ases_mc_pkg1-srv:<laser_control-request> is deprecated: use ases_mc_pkg1-srv:laser_control-request instead.")))

(cl:ensure-generic-function 'cmd_lasercontrol-val :lambda-list '(m))
(cl:defmethod cmd_lasercontrol-val ((m <laser_control-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-srv:cmd_lasercontrol-val is deprecated.  Use ases_mc_pkg1-srv:cmd_lasercontrol instead.")
  (cmd_lasercontrol m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <laser_control-request>) ostream)
  "Serializes a message object of type '<laser_control-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'cmd_lasercontrol))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'cmd_lasercontrol))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <laser_control-request>) istream)
  "Deserializes a message object of type '<laser_control-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cmd_lasercontrol) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'cmd_lasercontrol) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<laser_control-request>)))
  "Returns string type for a service object of type '<laser_control-request>"
  "ases_mc_pkg1/laser_controlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'laser_control-request)))
  "Returns string type for a service object of type 'laser_control-request"
  "ases_mc_pkg1/laser_controlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<laser_control-request>)))
  "Returns md5sum for a message object of type '<laser_control-request>"
  "e3f9c60fce0f55c2b7eb3a8b43ae70da")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'laser_control-request)))
  "Returns md5sum for a message object of type 'laser_control-request"
  "e3f9c60fce0f55c2b7eb3a8b43ae70da")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<laser_control-request>)))
  "Returns full string definition for message of type '<laser_control-request>"
  (cl:format cl:nil "string cmd_lasercontrol~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'laser_control-request)))
  "Returns full string definition for message of type 'laser_control-request"
  (cl:format cl:nil "string cmd_lasercontrol~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <laser_control-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'cmd_lasercontrol))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <laser_control-request>))
  "Converts a ROS message object to a list"
  (cl:list 'laser_control-request
    (cl:cons ':cmd_lasercontrol (cmd_lasercontrol msg))
))
;//! \htmlinclude laser_control-response.msg.html

(cl:defclass <laser_control-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass laser_control-response (<laser_control-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <laser_control-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'laser_control-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ases_mc_pkg1-srv:<laser_control-response> is deprecated: use ases_mc_pkg1-srv:laser_control-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <laser_control-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-srv:success-val is deprecated.  Use ases_mc_pkg1-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <laser_control-response>) ostream)
  "Serializes a message object of type '<laser_control-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <laser_control-response>) istream)
  "Deserializes a message object of type '<laser_control-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<laser_control-response>)))
  "Returns string type for a service object of type '<laser_control-response>"
  "ases_mc_pkg1/laser_controlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'laser_control-response)))
  "Returns string type for a service object of type 'laser_control-response"
  "ases_mc_pkg1/laser_controlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<laser_control-response>)))
  "Returns md5sum for a message object of type '<laser_control-response>"
  "e3f9c60fce0f55c2b7eb3a8b43ae70da")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'laser_control-response)))
  "Returns md5sum for a message object of type 'laser_control-response"
  "e3f9c60fce0f55c2b7eb3a8b43ae70da")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<laser_control-response>)))
  "Returns full string definition for message of type '<laser_control-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'laser_control-response)))
  "Returns full string definition for message of type 'laser_control-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <laser_control-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <laser_control-response>))
  "Converts a ROS message object to a list"
  (cl:list 'laser_control-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'laser_control)))
  'laser_control-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'laser_control)))
  'laser_control-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'laser_control)))
  "Returns string type for a service object of type '<laser_control>"
  "ases_mc_pkg1/laser_control")