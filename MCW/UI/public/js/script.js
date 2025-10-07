function disableInputs() {
  var wheelInput = document.getElementById("OverlapWheel");
  var rpmInput = document.getElementById("RPMWheel");
  var startButton = document.getElementById("startBtn");

  wheelInput.disabled = true;
  rpmInput.disabled = true;
  startButton.disabled = false;
}

function enableStart() {
  var wheelInput = document.getElementById("OverlapWheel");
  var rpmInput = document.getElementById("RPMWheel");
  var startButton = document.getElementById("startBtn");

  setTimeout(function () {
      wheelInput.disabled = false;
      rpmInput.disabled = false;
      startButton.disabled = true;
  }, 3000);
}


function testFunc() {
    console.log("Test Button Clicked")
}

function gripFunc() {
   console.log("Grip Button Clicked")
}
function releaseFunc() {
    console.log("Release Button Clicked")
}

function onFunc() {
    console.log("On Button Clicked")
}

function offFunc() {
  console.log("Off Button Clicked")
}
function weldingFunc() {
   console.log("Welding Button Clicked")
}

function parkFunc() {
   console.log("Parking Button Clicked")
}

function weldFunc() {
  console.log("WELD Button Clicked")
}
function stopFunc() {
   console.log("Stop Button Clicked")
}

function estopFunc() {
  console.log("Emergency Stop Button Clicked")
}

function saveFunc() {
  console.log("Save Button Clicked")
}

function exitFunc() {
   console.log("Exit Button Clicked")
}


function jobCompletedFunc()
{
    var logTextarea = document.getElementById('logTextarea');
    var currentTime = new Date().toLocaleString();
    var message = 'Job completed at ' + currentTime;

    logTextarea.value += message + '\n';
    logTextarea.scrollTop = logTextarea.scrollHeight;

  console.log('Job Completed Clicked')

}

// NumberWheels Activation

function changeOverlapFunc(){
  vueApp.OverlapWheel= Number(document.getElementById("OverlapWheel").value)
  console.log("Overlap Changed to " + vueApp.OverlapWheel)
}

function changeRPMFunc(){
  vueApp.RPMWheel= Number(document.getElementById("RPMWheel").value)
  console.log("RPM Changed to " + vueApp.RPMWheel)
}

///Position Control Activation
function changeFineXFunc(){
  
   vueApp.fPosx=document.getElementById("fPosx");
   position_x=vueApp.fPosx.value,
   console.log("Fine X Changed to %f", position_x);
   
   pos_service.callService(pos_request, (result) => {
    vueApp.service_busy = false
    vueApp.service_response = JSON.stringify(result)
    console.log("result")
  },

(error) => {
  vueApp.service_busy = false
  // console.error(error)
  console.error("Test")
})

  //  vueApp.posxCur=document.getElementById("posxCur");
  //  cur_position_x=vueApp.posxCur.value,
  //  cur_position_x=position_x,
  //  vueApp.posxCur.value=String(cur_position_x),
  //  console.log("Current Position X Changed to %f", cur_position_x);
  
}
function changeFineYFunc(){
  
  vueApp.fPosy=document.getElementById("fPosy");
  position_y=vueApp.fPosy.value,
  console.log("Fine Y Changed to %f", position_y);

  // vueApp.posyCur=document.getElementById("posyCur");
  // cur_position_y=vueApp.posyCur.value,
  // cur_position_y=position_y,
  // vueApp.posyCur.value=String(cur_position_y),
  // console.log("Current Position Y Changed to %f", cur_position_y);
 
}
function changeFineZFunc(){
  
  vueApp.fPosz=document.getElementById("fPosz");
  position_z=vueApp.fPosz.value,
  console.log("Fine Z Changed to %f", position_z);

  // vueApp.poszCur=document.getElementById("poszCur");
  // cur_position_z=vueApp.poszCur.value,
  // cur_position_z=position_z,
  // vueApp.poszCur.value=String(cur_position_z),
  // console.log("Current Position Z Changed to %f", cur_position_z);
 
}

function changeFineOrientFunc(){

  vueApp.fOrientation=document.getElementById("fOrientation");
  position_orientation=vueApp.fOrientation.value,
  console.log("Fine Orientation Changed to %f", position_orientation);

  // vueApp.orientationCur=document.getElementById("orientationCur");
  // cur_position_orient=vueApp.orientationCur.value,
  // cur_position_orient=position_orientation,
  // vueApp.orientationCur.value=String(cur_position_orient),
  // console.log("Current Orientation Changed to %f", cur_position_orient);
}

function changeFineRotationFunc(){

  vueApp.fRotation=document.getElementById("fRotation");
  position_rotation=vueApp.fRotation.value,
  console.log("Fine Rotation Changed to %f", position_rotation);

  // vueApp.rotationCur=document.getElementById("rotationCur");
  // cur_position_rot=vueApp.rotationCur.value,
  // cur_position_rot=position_rotation,
  // vueApp.rotationCur.value=String(cur_position_rot),
  // console.log("Current Rotation Changed to %f", cur_position_rot);
}

/// ROS Service

  //  function position_request(){
  //     Mode:'PPM',
  //     position_x=vueApp.fPosx,
  //     position_y=vueApp.fPosy,
  //     position_z=vueApp.fPosz,
 
  // }
     
  // var pos_service=new ROSLIB.Service({
  //   ros: vueApp.ros,
  //   name: '/axis_movement_srv',
  //   serviceType: 'ases_mc_pkg/axis_motion'  ,
  //   });
  
  
  // var pos_request = new ROSLIB.ServiceRequest({
  //   position_x:vueApp.fPosx,
  //   position_y:vueApp.fPosy,
  //   position_z:vueApp.fPosz,
  //   velocity_x:0,
  //   velocity_y:0,
  //   velocity_z:0,
  //     // console.log('Fine Position changed');
  // });
    
  

  
  

  


// function clearPosFunc()
// {
//   console.log('Clearing Positions Now')
//             park_service=new ROSLIB.Service({
//                 ros: vueApp.ros,
//                 name: '/move_to_parking_srv',
//                 serviceType: 'ases_mc_pkg/parking',              
//             })

//             park_request = new ROSLIB.ServiceRequest({
//                 start: true,                                   
//             })

//             park_service.callService(park_request, (result) => {
//                 vueApp.service_busy = false
//                 vueApp.service_response = JSON.stringify(result)
//                 console.log('Result for service call on '
//                 + park_service.name
//                 + result)
//             }, 
//             (error) => {
//                 vueApp.service_busy = false
//                 console.error(error)
//             })
// }
