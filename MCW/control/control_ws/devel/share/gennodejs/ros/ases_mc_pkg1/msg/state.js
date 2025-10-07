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

class state {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.z = null;
      this.o = null;
      this.g = null;
      this.r = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = false;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = false;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = false;
      }
      if (initObj.hasOwnProperty('o')) {
        this.o = initObj.o
      }
      else {
        this.o = false;
      }
      if (initObj.hasOwnProperty('g')) {
        this.g = initObj.g
      }
      else {
        this.g = false;
      }
      if (initObj.hasOwnProperty('r')) {
        this.r = initObj.r
      }
      else {
        this.r = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type state
    // Serialize message field [x]
    bufferOffset = _serializer.bool(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.bool(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.bool(obj.z, buffer, bufferOffset);
    // Serialize message field [o]
    bufferOffset = _serializer.bool(obj.o, buffer, bufferOffset);
    // Serialize message field [g]
    bufferOffset = _serializer.bool(obj.g, buffer, bufferOffset);
    // Serialize message field [r]
    bufferOffset = _serializer.bool(obj.r, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type state
    let len;
    let data = new state(null);
    // Deserialize message field [x]
    data.x = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [o]
    data.o = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [g]
    data.g = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [r]
    data.r = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ases_mc_pkg1/state';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '550bf2d382d07f1819d62fc2dab7258e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool x
    bool y
    bool z
    bool o
    bool g
    bool r
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new state(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = false
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = false
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = false
    }

    if (msg.o !== undefined) {
      resolved.o = msg.o;
    }
    else {
      resolved.o = false
    }

    if (msg.g !== undefined) {
      resolved.g = msg.g;
    }
    else {
      resolved.g = false
    }

    if (msg.r !== undefined) {
      resolved.r = msg.r;
    }
    else {
      resolved.r = false
    }

    return resolved;
    }
};

module.exports = state;
