; Auto-generated. Do not edit!


(cl:in-package ases_mc_pkg1-srv)


;//! \htmlinclude grip_release-request.msg.html

(cl:defclass <grip_release-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform ""))
)

(cl:defclass grip_release-request (<grip_release-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <grip_release-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'grip_release-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ases_mc_pkg1-srv:<grip_release-request> is deprecated: use ases_mc_pkg1-srv:grip_release-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <grip_release-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-srv:command-val is deprecated.  Use ases_mc_pkg1-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <grip_release-request>) ostream)
  "Serializes a message object of type '<grip_release-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <grip_release-request>) istream)
  "Deserializes a message object of type '<grip_release-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<grip_release-request>)))
  "Returns string type for a service object of type '<grip_release-request>"
  "ases_mc_pkg1/grip_releaseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'grip_release-request)))
  "Returns string type for a service object of type 'grip_release-request"
  "ases_mc_pkg1/grip_releaseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<grip_release-request>)))
  "Returns md5sum for a message object of type '<grip_release-request>"
  "031d24522d462b2314fd1b6270670dd2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'grip_release-request)))
  "Returns md5sum for a message object of type 'grip_release-request"
  "031d24522d462b2314fd1b6270670dd2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<grip_release-request>)))
  "Returns full string definition for message of type '<grip_release-request>"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'grip_release-request)))
  "Returns full string definition for message of type 'grip_release-request"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <grip_release-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <grip_release-request>))
  "Converts a ROS message object to a list"
  (cl:list 'grip_release-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude grip_release-response.msg.html

(cl:defclass <grip_release-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass grip_release-response (<grip_release-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <grip_release-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'grip_release-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ases_mc_pkg1-srv:<grip_release-response> is deprecated: use ases_mc_pkg1-srv:grip_release-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <grip_release-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-srv:success-val is deprecated.  Use ases_mc_pkg1-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <grip_release-response>) ostream)
  "Serializes a message object of type '<grip_release-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <grip_release-response>) istream)
  "Deserializes a message object of type '<grip_release-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<grip_release-response>)))
  "Returns string type for a service object of type '<grip_release-response>"
  "ases_mc_pkg1/grip_releaseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'grip_release-response)))
  "Returns string type for a service object of type 'grip_release-response"
  "ases_mc_pkg1/grip_releaseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<grip_release-response>)))
  "Returns md5sum for a message object of type '<grip_release-response>"
  "031d24522d462b2314fd1b6270670dd2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'grip_release-response)))
  "Returns md5sum for a message object of type 'grip_release-response"
  "031d24522d462b2314fd1b6270670dd2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<grip_release-response>)))
  "Returns full string definition for message of type '<grip_release-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'grip_release-response)))
  "Returns full string definition for message of type 'grip_release-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <grip_release-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <grip_release-response>))
  "Converts a ROS message object to a list"
  (cl:list 'grip_release-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'grip_release)))
  'grip_release-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'grip_release)))
  'grip_release-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'grip_release)))
  "Returns string type for a service object of type '<grip_release>"
  "ases_mc_pkg1/grip_release")