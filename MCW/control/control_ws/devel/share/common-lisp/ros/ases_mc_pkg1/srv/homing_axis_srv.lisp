; Auto-generated. Do not edit!


(cl:in-package ases_mc_pkg1-srv)


;//! \htmlinclude homing_axis_srv-request.msg.html

(cl:defclass <homing_axis_srv-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass homing_axis_srv-request (<homing_axis_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <homing_axis_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'homing_axis_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ases_mc_pkg1-srv:<homing_axis_srv-request> is deprecated: use ases_mc_pkg1-srv:homing_axis_srv-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <homing_axis_srv-request>) ostream)
  "Serializes a message object of type '<homing_axis_srv-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <homing_axis_srv-request>) istream)
  "Deserializes a message object of type '<homing_axis_srv-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<homing_axis_srv-request>)))
  "Returns string type for a service object of type '<homing_axis_srv-request>"
  "ases_mc_pkg1/homing_axis_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'homing_axis_srv-request)))
  "Returns string type for a service object of type 'homing_axis_srv-request"
  "ases_mc_pkg1/homing_axis_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<homing_axis_srv-request>)))
  "Returns md5sum for a message object of type '<homing_axis_srv-request>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'homing_axis_srv-request)))
  "Returns md5sum for a message object of type 'homing_axis_srv-request"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<homing_axis_srv-request>)))
  "Returns full string definition for message of type '<homing_axis_srv-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'homing_axis_srv-request)))
  "Returns full string definition for message of type 'homing_axis_srv-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <homing_axis_srv-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <homing_axis_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'homing_axis_srv-request
))
;//! \htmlinclude homing_axis_srv-response.msg.html

(cl:defclass <homing_axis_srv-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass homing_axis_srv-response (<homing_axis_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <homing_axis_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'homing_axis_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ases_mc_pkg1-srv:<homing_axis_srv-response> is deprecated: use ases_mc_pkg1-srv:homing_axis_srv-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <homing_axis_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-srv:success-val is deprecated.  Use ases_mc_pkg1-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <homing_axis_srv-response>) ostream)
  "Serializes a message object of type '<homing_axis_srv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <homing_axis_srv-response>) istream)
  "Deserializes a message object of type '<homing_axis_srv-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<homing_axis_srv-response>)))
  "Returns string type for a service object of type '<homing_axis_srv-response>"
  "ases_mc_pkg1/homing_axis_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'homing_axis_srv-response)))
  "Returns string type for a service object of type 'homing_axis_srv-response"
  "ases_mc_pkg1/homing_axis_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<homing_axis_srv-response>)))
  "Returns md5sum for a message object of type '<homing_axis_srv-response>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'homing_axis_srv-response)))
  "Returns md5sum for a message object of type 'homing_axis_srv-response"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<homing_axis_srv-response>)))
  "Returns full string definition for message of type '<homing_axis_srv-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'homing_axis_srv-response)))
  "Returns full string definition for message of type 'homing_axis_srv-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <homing_axis_srv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <homing_axis_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'homing_axis_srv-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'homing_axis_srv)))
  'homing_axis_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'homing_axis_srv)))
  'homing_axis_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'homing_axis_srv)))
  "Returns string type for a service object of type '<homing_axis_srv>"
  "ases_mc_pkg1/homing_axis_srv")