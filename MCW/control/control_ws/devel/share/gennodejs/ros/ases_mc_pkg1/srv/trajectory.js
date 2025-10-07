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

class trajectoryRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.trajectory_axis = null;
    }
    else {
      if (initObj.hasOwnProperty('trajectory_axis')) {
        this.trajectory_axis = initObj.trajectory_axis
      }
      else {
        this.trajectory_axis = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type trajectoryRequest
    // Serialize message field [trajectory_axis]
    bufferOffset = _serializer.string(obj.trajectory_axis, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type trajectoryRequest
    let len;
    let data = new trajectoryRequest(null);
    // Deserialize message field [trajectory_axis]
    data.trajectory_axis = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.trajectory_axis);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ases_mc_pkg1/trajectoryRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aaa6026c8c2eebcc0eefb49b735b2365';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string trajectory_axis
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new trajectoryRequest(null);
    if (msg.trajectory_axis !== undefined) {
      resolved.trajectory_axis = msg.trajectory_axis;
    }
    else {
      resolved.trajectory_axis = ''
    }

    return resolved;
    }
};

class trajectoryResponse {
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
    // Serializes a message object of type trajectoryResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type trajectoryResponse
    let len;
    let data = new trajectoryResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ases_mc_pkg1/trajectoryResponse';
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
    const resolved = new trajectoryResponse(null);
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
  Request: trajectoryRequest,
  Response: trajectoryResponse,
  md5sum() { return 'a07f1b0bb7ff82b3417aae6f2a566229'; },
  datatype() { return 'ases_mc_pkg1/trajectory'; }
};
