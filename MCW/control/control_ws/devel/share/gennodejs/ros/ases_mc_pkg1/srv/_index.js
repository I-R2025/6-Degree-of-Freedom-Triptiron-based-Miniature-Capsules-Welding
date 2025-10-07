
"use strict";

let automatic_job = require('./automatic_job.js')
let axis_motion = require('./axis_motion.js')
let grip_release = require('./grip_release.js')
let homing_axis_srv = require('./homing_axis_srv.js')
let laser_control = require('./laser_control.js')
let parking = require('./parking.js')
let trajectory = require('./trajectory.js')
let welding = require('./welding.js')

module.exports = {
  automatic_job: automatic_job,
  axis_motion: axis_motion,
  grip_release: grip_release,
  homing_axis_srv: homing_axis_srv,
  laser_control: laser_control,
  parking: parking,
  trajectory: trajectory,
  welding: welding,
};
