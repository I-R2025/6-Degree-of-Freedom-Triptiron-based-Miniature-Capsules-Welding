; Auto-generated. Do not edit!


(cl:in-package ases_mc_pkg1-srv)


;//! \htmlinclude automatic_job-request.msg.html

(cl:defclass <automatic_job-request> (roslisp-msg-protocol:ros-message)
  ((overlap
    :reader overlap
    :initarg :overlap
    :type cl:integer
    :initform 0)
   (rpm
    :reader rpm
    :initarg :rpm
    :type cl:float
    :initform 0.0)
   (job
    :reader job
    :initarg :job
    :type cl:string
    :initform ""))
)

(cl:defclass automatic_job-request (<automatic_job-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <automatic_job-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'automatic_job-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ases_mc_pkg1-srv:<automatic_job-request> is deprecated: use ases_mc_pkg1-srv:automatic_job-request instead.")))

(cl:ensure-generic-function 'overlap-val :lambda-list '(m))
(cl:defmethod overlap-val ((m <automatic_job-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-srv:overlap-val is deprecated.  Use ases_mc_pkg1-srv:overlap instead.")
  (overlap m))

(cl:ensure-generic-function 'rpm-val :lambda-list '(m))
(cl:defmethod rpm-val ((m <automatic_job-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-srv:rpm-val is deprecated.  Use ases_mc_pkg1-srv:rpm instead.")
  (rpm m))

(cl:ensure-generic-function 'job-val :lambda-list '(m))
(cl:defmethod job-val ((m <automatic_job-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-srv:job-val is deprecated.  Use ases_mc_pkg1-srv:job instead.")
  (job m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <automatic_job-request>) ostream)
  "Serializes a message object of type '<automatic_job-request>"
  (cl:let* ((signed (cl:slot-value msg 'overlap)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'rpm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'job))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'job))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <automatic_job-request>) istream)
  "Deserializes a message object of type '<automatic_job-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'overlap) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rpm) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'job) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'job) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<automatic_job-request>)))
  "Returns string type for a service object of type '<automatic_job-request>"
  "ases_mc_pkg1/automatic_jobRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'automatic_job-request)))
  "Returns string type for a service object of type 'automatic_job-request"
  "ases_mc_pkg1/automatic_jobRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<automatic_job-request>)))
  "Returns md5sum for a message object of type '<automatic_job-request>"
  "cfe80a97e30be51ef40c9219e69602d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'automatic_job-request)))
  "Returns md5sum for a message object of type 'automatic_job-request"
  "cfe80a97e30be51ef40c9219e69602d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<automatic_job-request>)))
  "Returns full string definition for message of type '<automatic_job-request>"
  (cl:format cl:nil "int64 overlap~%float64 rpm~%string job~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'automatic_job-request)))
  "Returns full string definition for message of type 'automatic_job-request"
  (cl:format cl:nil "int64 overlap~%float64 rpm~%string job~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <automatic_job-request>))
  (cl:+ 0
     8
     8
     4 (cl:length (cl:slot-value msg 'job))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <automatic_job-request>))
  "Converts a ROS message object to a list"
  (cl:list 'automatic_job-request
    (cl:cons ':overlap (overlap msg))
    (cl:cons ':rpm (rpm msg))
    (cl:cons ':job (job msg))
))
;//! \htmlinclude automatic_job-response.msg.html

(cl:defclass <automatic_job-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass automatic_job-response (<automatic_job-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <automatic_job-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'automatic_job-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ases_mc_pkg1-srv:<automatic_job-response> is deprecated: use ases_mc_pkg1-srv:automatic_job-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <automatic_job-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ases_mc_pkg1-srv:success-val is deprecated.  Use ases_mc_pkg1-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <automatic_job-response>) ostream)
  "Serializes a message object of type '<automatic_job-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <automatic_job-response>) istream)
  "Deserializes a message object of type '<automatic_job-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<automatic_job-response>)))
  "Returns string type for a service object of type '<automatic_job-response>"
  "ases_mc_pkg1/automatic_jobResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'automatic_job-response)))
  "Returns string type for a service object of type 'automatic_job-response"
  "ases_mc_pkg1/automatic_jobResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<automatic_job-response>)))
  "Returns md5sum for a message object of type '<automatic_job-response>"
  "cfe80a97e30be51ef40c9219e69602d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'automatic_job-response)))
  "Returns md5sum for a message object of type 'automatic_job-response"
  "cfe80a97e30be51ef40c9219e69602d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<automatic_job-response>)))
  "Returns full string definition for message of type '<automatic_job-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'automatic_job-response)))
  "Returns full string definition for message of type 'automatic_job-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <automatic_job-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <automatic_job-response>))
  "Converts a ROS message object to a list"
  (cl:list 'automatic_job-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'automatic_job)))
  'automatic_job-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'automatic_job)))
  'automatic_job-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'automatic_job)))
  "Returns string type for a service object of type '<automatic_job>"
  "ases_mc_pkg1/automatic_job")