// Auto-generated. Do not edit!

// (in-package ases_mc_pkg1.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Position_x = null;
      this.Position_y = null;
      this.Position_z = null;
      this.Position_o = null;
      this.Position_g = null;
      this.Position_r = null;
      this.GR_g = null;
      this.Current_x = null;
      this.Current_y = null;
      this.Current_z = null;
      this.Current_o = null;
      this.Current_g = null;
      this.Current_r = null;
    }
    else {
      if (initObj.hasOwnProperty('Position_x')) {
        this.Position_x = initObj.Position_x
      }
      else {
        this.Position_x = 0.0;
      }
      if (initObj.hasOwnProperty('Position_y')) {
        this.Position_y = initObj.Position_y
      }
      else {
        this.Position_y = 0.0;
      }
      if (initObj.hasOwnProperty('Position_z')) {
        this.Position_z = initObj.Position_z
      }
      else {
        this.Position_z = 0.0;
      }
      if (initObj.hasOwnProperty('Position_o')) {
        this.Position_o = initObj.Position_o
      }
      else {
        this.Position_o = 0.0;
      }
      if (initObj.hasOwnProperty('Position_g')) {
        this.Position_g = initObj.Position_g
      }
      else {
        this.Position_g = 0.0;
      }
      if (initObj.hasOwnProperty('Position_r')) {
        this.Position_r = initObj.Position_r
      }
      else {
        this.Position_r = 0.0;
      }
      if (initObj.hasOwnProperty('GR_g')) {
        this.GR_g = initObj.GR_g
      }
      else {
        this.GR_g = 0;
      }
      if (initObj.hasOwnProperty('Current_x')) {
        this.Current_x = initObj.Current_x
      }
      else {
        this.Current_x = 0.0;
      }
      if (initObj.hasOwnProperty('Current_y')) {
        this.Current_y = initObj.Current_y
      }
      else {
        this.Current_y = 0.0;
      }
      if (initObj.hasOwnProperty('Current_z')) {
        this.Current_z = initObj.Current_z
      }
      else {
        this.Current_z = 0.0;
      }
      if (initObj.hasOwnProperty('Current_o')) {
        this.Current_o = initObj.Current_o
      }
      else {
        this.Current_o = 0.0;
      }
      if (initObj.hasOwnProperty('Current_g')) {
        this.Current_g = initObj.Current_g
      }
      else {
        this.Current_g = 0.0;
      }
      if (initObj.hasOwnProperty('Current_r')) {
        this.Current_r = initObj.Current_r
      }
      else {
        this.Current_r = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type status
    // Serialize message field [Position_x]
    bufferOffset = _serializer.float32(obj.Position_x, buffer, bufferOffset);
    // Serialize message field [Position_y]
    bufferOffset = _serializer.float32(obj.Position_y, buffer, bufferOffset);
    // Serialize message field [Position_z]
    bufferOffset = _serializer.float32(obj.Position_z, buffer, bufferOffset);
    // Serialize message field [Position_o]
    bufferOffset = _serializer.float32(obj.Position_o, buffer, bufferOffset);
    // Serialize message field [Position_g]
    bufferOffset = _serializer.float32(obj.Position_g, buffer, bufferOffset);
    // Serialize message field [Position_r]
    bufferOffset = _serializer.float32(obj.Position_r, buffer, bufferOffset);
    // Serialize message field [GR_g]
    bufferOffset = _serializer.int32(obj.GR_g, buffer, bufferOffset);
    // Serialize message field [Current_x]
    bufferOffset = _serializer.float32(obj.Current_x, buffer, bufferOffset);
    // Serialize message field [Current_y]
    bufferOffset = _serializer.float32(obj.Current_y, buffer, bufferOffset);
    // Serialize message field [Current_z]
    bufferOffset = _serializer.float32(obj.Current_z, buffer, bufferOffset);
    // Serialize message field [Current_o]
    bufferOffset = _serializer.float32(obj.Current_o, buffer, bufferOffset);
    // Serialize message field [Current_g]
    bufferOffset = _serializer.float32(obj.Current_g, buffer, bufferOffset);
    // Serialize message field [Current_r]
    bufferOffset = _serializer.float32(obj.Current_r, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type status
    let len;
    let data = new status(null);
    // Deserialize message field [Position_x]
    data.Position_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Position_y]
    data.Position_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Position_z]
    data.Position_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Position_o]
    data.Position_o = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Position_g]
    data.Position_g = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Position_r]
    data.Position_r = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [GR_g]
    data.GR_g = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Current_x]
    data.Current_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Current_y]
    data.Current_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Current_z]
    data.Current_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Current_o]
    data.Current_o = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Current_g]
    data.Current_g = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Current_r]
    data.Current_r = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 52;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ases_mc_pkg1/status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '80a82fb24463903407d9067cb2bffe7b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 Position_x
    float32 Position_y
    float32 Position_z
    float32 Position_o
    float32 Position_g
    float32 Position_r
    int32 GR_g
    float32 Current_x
    float32 Current_y
    float32 Current_z
    float32 Current_o
    float32 Current_g
    float32 Current_r
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new status(null);
    if (msg.Position_x !== undefined) {
      resolved.Position_x = msg.Position_x;
    }
    else {
      resolved.Position_x = 0.0
    }

    if (msg.Position_y !== undefined) {
      resolved.Position_y = msg.Position_y;
    }
    else {
      resolved.Position_y = 0.0
    }

    if (msg.Position_z !== undefined) {
      resolved.Position_z = msg.Position_z;
    }
    else {
      resolved.Position_z = 0.0
    }

    if (msg.Position_o !== undefined) {
      resolved.Position_o = msg.Position_o;
    }
    else {
      resolved.Position_o = 0.0
    }

    if (msg.Position_g !== undefined) {
      resolved.Position_g = msg.Position_g;
    }
    else {
      resolved.Position_g = 0.0
    }

    if (msg.Position_r !== undefined) {
      resolved.Position_r = msg.Position_r;
    }
    else {
      resolved.Position_r = 0.0
    }

    if (msg.GR_g !== undefined) {
      resolved.GR_g = msg.GR_g;
    }
    else {
      resolved.GR_g = 0
    }

    if (msg.Current_x !== undefined) {
      resolved.Current_x = msg.Current_x;
    }
    else {
      resolved.Current_x = 0.0
    }

    if (msg.Current_y !== undefined) {
      resolved.Current_y = msg.Current_y;
    }
    else {
      resolved.Current_y = 0.0
    }

    if (msg.Current_z !== undefined) {
      resolved.Current_z = msg.Current_z;
    }
    else {
      resolved.Current_z = 0.0
    }

    if (msg.Current_o !== undefined) {
      resolved.Current_o = msg.Current_o;
    }
    else {
      resolved.Current_o = 0.0
    }

    if (msg.Current_g !== undefined) {
      resolved.Current_g = msg.Current_g;
    }
    else {
      resolved.Current_g = 0.0
    }

    if (msg.Current_r !== undefined) {
      resolved.Current_r = msg.Current_r;
    }
    else {
      resolved.Current_r = 0.0
    }

    return resolved;
    }
};

module.exports = status;
