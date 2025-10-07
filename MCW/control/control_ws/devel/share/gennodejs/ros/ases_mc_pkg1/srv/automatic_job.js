// Auto-generated. Do not edit!

// (in-package ases_mc_pkg1.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class automatic_jobRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.overlap = null;
      this.rpm = null;
      this.job = null;
    }
    else {
      if (initObj.hasOwnProperty('overlap')) {
        this.overlap = initObj.overlap
      }
      else {
        this.overlap = 0;
      }
      if (initObj.hasOwnProperty('rpm')) {
        this.rpm = initObj.rpm
      }
      else {
        this.rpm = 0.0;
      }
      if (initObj.hasOwnProperty('job')) {
        this.job = initObj.job
      }
      else {
        this.job = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type automatic_jobRequest
    // Serialize message field [overlap]
    bufferOffset = _serializer.int64(obj.overlap, buffer, bufferOffset);
    // Serialize message field [rpm]
    bufferOffset = _serializer.float64(obj.rpm, buffer, bufferOffset);
    // Serialize message field [job]
    bufferOffset = _serializer.string(obj.job, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type automatic_jobRequest
    let len;
    let data = new automatic_jobRequest(null);
    // Deserialize message field [overlap]
    data.overlap = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [rpm]
    data.rpm = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [job]
    data.job = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.job);
    return length + 20;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ases_mc_pkg1/automatic_jobRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ac02e20925030f595af8d6004016c5d5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 overlap
    float64 rpm
    string job
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new automatic_jobRequest(null);
    if (msg.overlap !== undefined) {
      resolved.overlap = msg.overlap;
    }
    else {
      resolved.overlap = 0
    }

    if (msg.rpm !== undefined) {
      resolved.rpm = msg.rpm;
    }
    else {
      resolved.rpm = 0.0
    }

    if (msg.job !== undefined) {
      resolved.job = msg.job;
    }
    else {
      resolved.job = ''
    }

    return resolved;
    }
};

class automatic_jobResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type automatic_jobResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type automatic_jobResponse
    let len;
    let data = new automatic_jobResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ases_mc_pkg1/automatic_jobResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new automatic_jobResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: automatic_jobRequest,
  Response: automatic_jobResponse,
  md5sum() { return 'cfe80a97e30be51ef40c9219e69602d9'; },
  datatype() { return 'ases_mc_pkg1/automatic_job'; }
};
