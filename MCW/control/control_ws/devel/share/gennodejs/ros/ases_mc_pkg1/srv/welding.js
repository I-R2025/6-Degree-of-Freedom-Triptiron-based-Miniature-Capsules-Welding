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

class weldingRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cmd_welding = null;
    }
    else {
      if (initObj.hasOwnProperty('cmd_welding')) {
        this.cmd_welding = initObj.cmd_welding
      }
      else {
        this.cmd_welding = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type weldingRequest
    // Serialize message field [cmd_welding]
    bufferOffset = _serializer.string(obj.cmd_welding, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type weldingRequest
    let len;
    let data = new weldingRequest(null);
    // Deserialize message field [cmd_welding]
    data.cmd_welding = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.cmd_welding);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ases_mc_pkg1/weldingRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '384019d8885c283bef498653abb3ad57';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string cmd_welding
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new weldingRequest(null);
    if (msg.cmd_welding !== undefined) {
      resolved.cmd_welding = msg.cmd_welding;
    }
    else {
      resolved.cmd_welding = ''
    }

    return resolved;
    }
};

class weldingResponse {
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
    // Serializes a message object of type weldingResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type weldingResponse
    let len;
    let data = new weldingResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ases_mc_pkg1/weldingResponse';
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
    const resolved = new weldingResponse(null);
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
  Request: weldingRequest,
  Response: weldingResponse,
  md5sum() { return '0d4d374987d43cb065ea6a57001df011'; },
  datatype() { return 'ases_mc_pkg1/welding'; }
};
