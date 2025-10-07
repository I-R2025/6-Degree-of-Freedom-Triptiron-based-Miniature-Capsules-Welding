; Auto-generated. Do not edit!


(cl:in-package ases_mc_pkg1-srv)


;//! \htmlinclude trajectory-request.msg.html

(cl:defclass <trajectory-request> (roslisp-msg-protocol:ros-message)
  ((trajectory_axis
    :reader trajectory_axis
    :initarg :trajectory_axis
    :type cl:string
    :initform ""))
)

(cl:defclass trajectory-request (<trajectory-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <trajectory-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'trajectory-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ases_mc_pkg1-srv:<trajectory-request> is deprecated: use ases_mc_pkg1-srv:trajectory-request instead.")))

(cl:ensure-generic-function 'trajectory_axis-val :lambda-list '(m))
(cl:defmethod trajectory_axis-val ((m <trajectory-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-srv:trajectory_axis-val is deprecated.  Use ases_mc_pkg1-srv:trajectory_axis instead.")
  (trajectory_axis m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <trajectory-request>) ostream)
  "Serializes a message object of type '<trajectory-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'trajectory_axis))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'trajectory_axis))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <trajectory-request>) istream)
  "Deserializes a message object of type '<trajectory-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'trajectory_axis) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'trajectory_axis) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<trajectory-request>)))
  "Returns string type for a service object of type '<trajectory-request>"
  "ases_mc_pkg1/trajectoryRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'trajectory-request)))
  "Returns string type for a service object of type 'trajectory-request"
  "ases_mc_pkg1/trajectoryRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<trajectory-request>)))
  "Returns md5sum for a message object of type '<trajectory-request>"
  "a07f1b0bb7ff82b3417aae6f2a566229")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'trajectory-request)))
  "Returns md5sum for a message object of type 'trajectory-request"
  "a07f1b0bb7ff82b3417aae6f2a566229")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<trajectory-request>)))
  "Returns full string definition for message of type '<trajectory-request>"
  (cl:format cl:nil "string trajectory_axis~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'trajectory-request)))
  "Returns full string definition for message of type 'trajectory-request"
  (cl:format cl:nil "string trajectory_axis~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <trajectory-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'trajectory_axis))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <trajectory-request>))
  "Converts a ROS message object to a list"
  (cl:list 'trajectory-request
    (cl:cons ':trajectory_axis (trajectory_axis msg))
))
;//! \htmlinclude trajectory-response.msg.html

(cl:defclass <trajectory-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass trajectory-response (<trajectory-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <trajectory-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'trajectory-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ases_mc_pkg1-srv:<trajectory-response> is deprecated: use ases_mc_pkg1-srv:trajectory-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <trajectory-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-srv:success-val is deprecated.  Use ases_mc_pkg1-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <trajectory-response>) ostream)
  "Serializes a message object of type '<trajectory-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <trajectory-response>) istream)
  "Deserializes a message object of type '<trajectory-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<trajectory-response>)))
  "Returns string type for a service object of type '<trajectory-response>"
  "ases_mc_pkg1/trajectoryResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'trajectory-response)))
  "Returns string type for a service object of type 'trajectory-response"
  "ases_mc_pkg1/trajectoryResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<trajectory-response>)))
  "Returns md5sum for a message object of type '<trajectory-response>"
  "a07f1b0bb7ff82b3417aae6f2a566229")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'trajectory-response)))
  "Returns md5sum for a message object of type 'trajectory-response"
  "a07f1b0bb7ff82b3417aae6f2a566229")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<trajectory-response>)))
  "Returns full string definition for message of type '<trajectory-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'trajectory-response)))
  "Returns full string definition for message of type 'trajectory-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <trajectory-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <trajectory-response>))
  "Converts a ROS message object to a list"
  (cl:list 'trajectory-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'trajectory)))
  'trajectory-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'trajectory)))
  'trajectory-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'trajectory)))
  "Returns string type for a service object of type '<trajectory>"
  "ases_mc_pkg1/trajectory")