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

class axis_motionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Mode = null;
      this.position_x = null;
      this.position_y = null;
      this.position_z = null;
      this.position_o = null;
      this.position_g = null;
      this.position_r = null;
      this.velocity_x = null;
      this.velocity_y = null;
      this.velocity_z = null;
      this.velocity_o = null;
      this.velocity_g = null;
      this.velocity_r = null;
    }
    else {
      if (initObj.hasOwnProperty('Mode')) {
        this.Mode = initObj.Mode
      }
      else {
        this.Mode = '';
      }
      if (initObj.hasOwnProperty('position_x')) {
        this.position_x = initObj.position_x
      }
      else {
        this.position_x = 0.0;
      }
      if (initObj.hasOwnProperty('position_y')) {
        this.position_y = initObj.position_y
      }
      else {
        this.position_y = 0.0;
      }
      if (initObj.hasOwnProperty('position_z')) {
        this.position_z = initObj.position_z
      }
      else {
        this.position_z = 0.0;
      }
      if (initObj.hasOwnProperty('position_o')) {
        this.position_o = initObj.position_o
      }
      else {
        this.position_o = 0.0;
      }
      if (initObj.hasOwnProperty('position_g')) {
        this.position_g = initObj.position_g
      }
      else {
        this.position_g = 0.0;
      }
      if (initObj.hasOwnProperty('position_r')) {
        this.position_r = initObj.position_r
      }
      else {
        this.position_r = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_x')) {
        this.velocity_x = initObj.velocity_x
      }
      else {
        this.velocity_x = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_y')) {
        this.velocity_y = initObj.velocity_y
      }
      else {
        this.velocity_y = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_z')) {
        this.velocity_z = initObj.velocity_z
      }
      else {
        this.velocity_z = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_o')) {
        this.velocity_o = initObj.velocity_o
      }
      else {
        this.velocity_o = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_g')) {
        this.velocity_g = initObj.velocity_g
      }
      else {
        this.velocity_g = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_r')) {
        this.velocity_r = initObj.velocity_r
      }
      else {
        this.velocity_r = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type axis_motionRequest
    // Serialize message field [Mode]
    bufferOffset = _serializer.string(obj.Mode, buffer, bufferOffset);
    // Serialize message field [position_x]
    bufferOffset = _serializer.float64(obj.position_x, buffer, bufferOffset);
    // Serialize message field [position_y]
    bufferOffset = _serializer.float64(obj.position_y, buffer, bufferOffset);
    // Serialize message field [position_z]
    bufferOffset = _serializer.float64(obj.position_z, buffer, bufferOffset);
    // Serialize message field [position_o]
    bufferOffset = _serializer.float64(obj.position_o, buffer, bufferOffset);
    // Serialize message field [position_g]
    bufferOffset = _serializer.float64(obj.position_g, buffer, bufferOffset);
    // Serialize message field [position_r]
    bufferOffset = _serializer.float64(obj.position_r, buffer, bufferOffset);
    // Serialize message field [velocity_x]
    bufferOffset = _serializer.float64(obj.velocity_x, buffer, bufferOffset);
    // Serialize message field [velocity_y]
    bufferOffset = _serializer.float64(obj.velocity_y, buffer, bufferOffset);
    // Serialize message field [velocity_z]
    bufferOffset = _serializer.float64(obj.velocity_z, buffer, bufferOffset);
    // Serialize message field [velocity_o]
    bufferOffset = _serializer.float64(obj.velocity_o, buffer, bufferOffset);
    // Serialize message field [velocity_g]
    bufferOffset = _serializer.float64(obj.velocity_g, buffer, bufferOffset);
    // Serialize message field [velocity_r]
    bufferOffset = _serializer.float64(obj.velocity_r, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type axis_motionRequest
    let len;
    let data = new axis_motionRequest(null);
    // Deserialize message field [Mode]
    data.Mode = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [position_x]
    data.position_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_y]
    data.position_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_z]
    data.position_z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_o]
    data.position_o = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_g]
    data.position_g = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_r]
    data.position_r = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_x]
    data.velocity_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_y]
    data.velocity_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_z]
    data.velocity_z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_o]
    data.velocity_o = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_g]
    data.velocity_g = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_r]
    data.velocity_r = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.Mode);
    return length + 100;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ases_mc_pkg1/axis_motionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '76756f30e03f8da3870aac37a0c734f4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string Mode
    float64 position_x
    float64 position_y
    float64 position_z
    float64 position_o
    float64 position_g
    float64 position_r
    float64 velocity_x
    float64 velocity_y
    float64 velocity_z
    float64 velocity_o
    float64 velocity_g
    float64 velocity_r
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new axis_motionRequest(null);
    if (msg.Mode !== undefined) {
      resolved.Mode = msg.Mode;
    }
    else {
      resolved.Mode = ''
    }

    if (msg.position_x !== undefined) {
      resolved.position_x = msg.position_x;
    }
    else {
      resolved.position_x = 0.0
    }

    if (msg.position_y !== undefined) {
      resolved.position_y = msg.position_y;
    }
    else {
      resolved.position_y = 0.0
    }

    if (msg.position_z !== undefined) {
      resolved.position_z = msg.position_z;
    }
    else {
      resolved.position_z = 0.0
    }

    if (msg.position_o !== undefined) {
      resolved.position_o = msg.position_o;
    }
    else {
      resolved.position_o = 0.0
    }

    if (msg.position_g !== undefined) {
      resolved.position_g = msg.position_g;
    }
    else {
      resolved.position_g = 0.0
    }

    if (msg.position_r !== undefined) {
      resolved.position_r = msg.position_r;
    }
    else {
      resolved.position_r = 0.0
    }

    if (msg.velocity_x !== undefined) {
      resolved.velocity_x = msg.velocity_x;
    }
    else {
      resolved.velocity_x = 0.0
    }

    if (msg.velocity_y !== undefined) {
      resolved.velocity_y = msg.velocity_y;
    }
    else {
      resolved.velocity_y = 0.0
    }

    if (msg.velocity_z !== undefined) {
      resolved.velocity_z = msg.velocity_z;
    }
    else {
      resolved.velocity_z = 0.0
    }

    if (msg.velocity_o !== undefined) {
      resolved.velocity_o = msg.velocity_o;
    }
    else {
      resolved.velocity_o = 0.0
    }

    if (msg.velocity_g !== undefined) {
      resolved.velocity_g = msg.velocity_g;
    }
    else {
      resolved.velocity_g = 0.0
    }

    if (msg.velocity_r !== undefined) {
      resolved.velocity_r = msg.velocity_r;
    }
    else {
      resolved.velocity_r = 0.0
    }

    return resolved;
    }
};

class axis_motionResponse {
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
    // Serializes a message object of type axis_motionResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type axis_motionResponse
    let len;
    let data = new axis_motionResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ases_mc_pkg1/axis_motionResponse';
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
    const resolved = new axis_motionResponse(null);
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
  Request: axis_motionRequest,
  Response: axis_motionResponse,
  md5sum() { return 'c335753bd65b2110697b8c82c9ecf78e'; },
  datatype() { return 'ases_mc_pkg1/axis_motion'; }
};
