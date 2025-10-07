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

class laser_controlRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cmd_lasercontrol = null;
    }
    else {
      if (initObj.hasOwnProperty('cmd_lasercontrol')) {
        this.cmd_lasercontrol = initObj.cmd_lasercontrol
      }
      else {
        this.cmd_lasercontrol = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type laser_controlRequest
    // Serialize message field [cmd_lasercontrol]
    bufferOffset = _serializer.string(obj.cmd_lasercontrol, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type laser_controlRequest
    let len;
    let data = new laser_controlRequest(null);
    // Deserialize message field [cmd_lasercontrol]
    data.cmd_lasercontrol = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.cmd_lasercontrol);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ases_mc_pkg1/laser_controlRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd324c2a313cd6bae1b1c064d94313788';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string cmd_lasercontrol
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new laser_controlRequest(null);
    if (msg.cmd_lasercontrol !== undefined) {
      resolved.cmd_lasercontrol = msg.cmd_lasercontrol;
    }
    else {
      resolved.cmd_lasercontrol = ''
    }

    return resolved;
    }
};

class laser_controlResponse {
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
    // Serializes a message object of type laser_controlResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type laser_controlResponse
    let len;
    let data = new laser_controlResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ases_mc_pkg1/laser_controlResponse';
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
    const resolved = new laser_controlResponse(null);
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
  Request: laser_controlRequest,
  Response: laser_controlResponse,
  md5sum() { return 'e3f9c60fce0f55c2b7eb3a8b43ae70da'; },
  datatype() { return 'ases_mc_pkg1/laser_control'; }
};
