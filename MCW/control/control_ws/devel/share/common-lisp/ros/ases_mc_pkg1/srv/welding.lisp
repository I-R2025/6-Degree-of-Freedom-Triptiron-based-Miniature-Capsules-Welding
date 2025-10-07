; Auto-generated. Do not edit!


(cl:in-package ases_mc_pkg1-srv)


;//! \htmlinclude welding-request.msg.html

(cl:defclass <welding-request> (roslisp-msg-protocol:ros-message)
  ((cmd_welding
    :reader cmd_welding
    :initarg :cmd_welding
    :type cl:string
    :initform ""))
)

(cl:defclass welding-request (<welding-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <welding-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'welding-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ases_mc_pkg1-srv:<welding-request> is deprecated: use ases_mc_pkg1-srv:welding-request instead.")))

(cl:ensure-generic-function 'cmd_welding-val :lambda-list '(m))
(cl:defmethod cmd_welding-val ((m <welding-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-srv:cmd_welding-val is deprecated.  Use ases_mc_pkg1-srv:cmd_welding instead.")
  (cmd_welding m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <welding-request>) ostream)
  "Serializes a message object of type '<welding-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'cmd_welding))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'cmd_welding))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <welding-request>) istream)
  "Deserializes a message object of type '<welding-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cmd_welding) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'cmd_welding) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<welding-request>)))
  "Returns string type for a service object of type '<welding-request>"
  "ases_mc_pkg1/weldingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'welding-request)))
  "Returns string type for a service object of type 'welding-request"
  "ases_mc_pkg1/weldingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<welding-request>)))
  "Returns md5sum for a message object of type '<welding-request>"
  "0d4d374987d43cb065ea6a57001df011")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'welding-request)))
  "Returns md5sum for a message object of type 'welding-request"
  "0d4d374987d43cb065ea6a57001df011")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<welding-request>)))
  "Returns full string definition for message of type '<welding-request>"
  (cl:format cl:nil "string cmd_welding~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'welding-request)))
  "Returns full string definition for message of type 'welding-request"
  (cl:format cl:nil "string cmd_welding~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <welding-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'cmd_welding))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <welding-request>))
  "Converts a ROS message object to a list"
  (cl:list 'welding-request
    (cl:cons ':cmd_welding (cmd_welding msg))
))
;//! \htmlinclude welding-response.msg.html

(cl:defclass <welding-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass welding-response (<welding-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <welding-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'welding-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ases_mc_pkg1-srv:<welding-response> is deprecated: use ases_mc_pkg1-srv:welding-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <welding-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-srv:success-val is deprecated.  Use ases_mc_pkg1-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <welding-response>) ostream)
  "Serializes a message object of type '<welding-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <welding-response>) istream)
  "Deserializes a message object of type '<welding-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<welding-response>)))
  "Returns string type for a service object of type '<welding-response>"
  "ases_mc_pkg1/weldingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'welding-response)))
  "Returns string type for a service object of type 'welding-response"
  "ases_mc_pkg1/weldingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<welding-response>)))
  "Returns md5sum for a message object of type '<welding-response>"
  "0d4d374987d43cb065ea6a57001df011")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'welding-response)))
  "Returns md5sum for a message object of type 'welding-response"
  "0d4d374987d43cb065ea6a57001df011")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<welding-response>)))
  "Returns full string definition for message of type '<welding-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'welding-response)))
  "Returns full string definition for message of type 'welding-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <welding-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <welding-response>))
  "Converts a ROS message object to a list"
  (cl:list 'welding-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'welding)))
  'welding-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'welding)))
  'welding-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'welding)))
  "Returns string type for a service object of type '<welding>"
  "ases_mc_pkg1/welding")