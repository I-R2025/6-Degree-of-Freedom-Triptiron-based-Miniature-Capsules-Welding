; Auto-generated. Do not edit!


(cl:in-package ases_mc_pkg1-srv)


;//! \htmlinclude parking-request.msg.html

(cl:defclass <parking-request> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass parking-request (<parking-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <parking-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'parking-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ases_mc_pkg1-srv:<parking-request> is deprecated: use ases_mc_pkg1-srv:parking-request instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <parking-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-srv:start-val is deprecated.  Use ases_mc_pkg1-srv:start instead.")
  (start m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <parking-request>) ostream)
  "Serializes a message object of type '<parking-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'start) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <parking-request>) istream)
  "Deserializes a message object of type '<parking-request>"
    (cl:setf (cl:slot-value msg 'start) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<parking-request>)))
  "Returns string type for a service object of type '<parking-request>"
  "ases_mc_pkg1/parkingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'parking-request)))
  "Returns string type for a service object of type 'parking-request"
  "ases_mc_pkg1/parkingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<parking-request>)))
  "Returns md5sum for a message object of type '<parking-request>"
  "bbb7ba84302b6f35af5466a95cd7ac90")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'parking-request)))
  "Returns md5sum for a message object of type 'parking-request"
  "bbb7ba84302b6f35af5466a95cd7ac90")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<parking-request>)))
  "Returns full string definition for message of type '<parking-request>"
  (cl:format cl:nil "bool start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'parking-request)))
  "Returns full string definition for message of type 'parking-request"
  (cl:format cl:nil "bool start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <parking-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <parking-request>))
  "Converts a ROS message object to a list"
  (cl:list 'parking-request
    (cl:cons ':start (start msg))
))
;//! \htmlinclude parking-response.msg.html

(cl:defclass <parking-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass parking-response (<parking-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <parking-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'parking-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ases_mc_pkg1-srv:<parking-response> is deprecated: use ases_mc_pkg1-srv:parking-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <parking-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-srv:success-val is deprecated.  Use ases_mc_pkg1-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <parking-response>) ostream)
  "Serializes a message object of type '<parking-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <parking-response>) istream)
  "Deserializes a message object of type '<parking-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<parking-response>)))
  "Returns string type for a service object of type '<parking-response>"
  "ases_mc_pkg1/parkingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'parking-response)))
  "Returns string type for a service object of type 'parking-response"
  "ases_mc_pkg1/parkingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<parking-response>)))
  "Returns md5sum for a message object of type '<parking-response>"
  "bbb7ba84302b6f35af5466a95cd7ac90")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'parking-response)))
  "Returns md5sum for a message object of type 'parking-response"
  "bbb7ba84302b6f35af5466a95cd7ac90")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<parking-response>)))
  "Returns full string definition for message of type '<parking-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'parking-response)))
  "Returns full string definition for message of type 'parking-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <parking-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <parking-response>))
  "Converts a ROS message object to a list"
  (cl:list 'parking-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'parking)))
  'parking-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'parking)))
  'parking-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'parking)))
  "Returns string type for a service object of type '<parking>"
  "ases_mc_pkg1/parking")