var logMessage = '';
var fileMessage = '';
var autoSaveperiod = 5; //Set auto save log period in seconds

var logBox = document.getElementById("textArea");
var overLoop;
var rpm;

var userid = localStorage.getItem("userid");
var sessionName = localStorage.getItem("fileName");
var fileName = sessionName + ".elog";

var grip_release;
var Welding_ON;
var autoJobSet=false;

var cam1FileName = sessionName + "cam1.mp4" ;
var cam2FileName = sessionName + "cam2.mp4" ;
var logContent;
var publisher =false;

// const {exec} = require('child_process');
const status = document.getElementById('status');

function checkPublisher(){

  if(!publisher) {
    console.log("Publisher node for motion control stopped");
    linx.classList.add("purple-light");  
    linx.classList.remove("green-light");
    linx.classList.remove("red-light");
    changeColorAndText(linx.id);
      
    liny.classList.add("purple-light");  
    liny.classList.remove("green-light");
    liny.classList.remove("red-light"); 
    changeColorAndText(liny.id);
  
    linz.classList.add("purple-light");  
    linz.classList.remove("green-light");
    linz.classList.remove("red-light"); 
    changeColorAndText(linz.id);

    orientation.classList.add("purple-light");  
    orientation.classList.remove("green-light");
    orientation.classList.remove("red-light"); 
    changeColorAndText(orientation.id);
   
    rotation.classList.add("purple-light");  
    rotation.classList.remove("green-light");
    rotation.classList.remove("red-light"); 
    changeColorAndText(rotation.id);

    gripper.classList.add("purple-light");  
    gripper.classList.remove("green-light");
    gripper.classList.remove("red-light"); 
    changeColorAndText(gripper.id);

  }

  publisher=false;
}

/////////////////////////////////////////////////////////////////////////////////
// Initialization when the page loads////////////////////////////////////////////
window.onload = function() {
  console.log("Page loaded here");
  publisher= false;
  logContent = localStorage.getItem("logContent" + '\n');
  setInterval(checkPublisher, 1000)
  setInterval(createAndDownloadLogFile, autoSaveperiod*1000);
  document.getElementById("grip").disabled = true;
 

  window.history.pushState(null, null, window.location.href);
    window.onpopstate = function () {
        window.history.go(1);}
/////////////////////////////////////////////////////////////////////////////////////////
  // Subscribing to Topic /errormsg
/////////////////////////////////////////////////////////////////////////////////////////
  
};

var errorListener = new ROSLIB.Topic({
  ros : vueApp.ros,
  name : '/errormsg',
  messageType : 'std_msgs/String'
});

errorListener.subscribe(function(message){
  console.log('Received message : ' + errorListener.name + ': ' + message.data);
  var currentTime = new Date();
  var formattedTime = currentTime.toLocaleString();
  message = '\n' + formattedTime + ": " + "Error: '" + message.data + "'"; 
  var logMessageHTML = message;
  logBox.innerHTML = logBox.innerHTML + logMessageHTML;
  logBox.scrollTop=logBox.scrollHeight;
  
  fileMessage = fileMessage + logMessageHTML;

})

   // Subscribing to a Topic /State
  // // ----------------------
  var LedListener = new ROSLIB.Topic({
    ros : vueApp.ros,
    name : '/state',
    messageType : 'ases_mc_pkg1/state'
  });

  LedListener.subscribe(function(message) {
  //  console.log('Received message on ' + LedListener.name + ': ' + message.x);
   document.getElementById("linx").value= message.x ;
   document.getElementById("liny").value= message.y ;
   document.getElementById("linz").value= message.z ;
   document.getElementById("orientation").value= message.o ;
   document.getElementById("rotation").value= message.r ;
   document.getElementById("gripper").value= message.g ;

   if(!linx.value)
   {
     linx.classList.add("green-light");
     linx.classList.remove("red-light");
     linx.classList.remove("purple-light");

   }
 
   else 
   {
     linx.classList.remove("green-light");
     linx.classList.add("red-light");
     linx.classList.remove("purple-light");
    }
 
   changeColorAndText(linx.id);
    
  if(!liny.value)
   {
     liny.classList.add("green-light");
     liny.classList.remove("red-light");
     liny.classList.remove("purple-light");
 
   }
 
   else 
   {
     liny.classList.remove("green-light");
     liny.classList.add("red-light");
     liny.classList.remove("purple-light");
 
   }
 
   changeColorAndText(liny.id);
   
 if(!linz.value)
   {
     linz.classList.add("green-light");
     linz.classList.remove("red-light");
     linz.classList.remove("purple-light");
 
   }
 
   else 
   {
     linz.classList.remove("green-light");
     linz.classList.add("red-light");
     linz.classList.remove("purple-light");
 
   }
 
   changeColorAndText(linz.id);
 
     
  if(!rotation.value)
   {
     rotation.classList.add("green-light");
     rotation.classList.remove("red-light");
     rotation.classList.remove("purple-light");
 
   }
 
   else 
   {
     rotation.classList.remove("green-light");
     rotation.classList.add("red-light");
     rotation.classList.remove("purple-light");
 
   }
 
   changeColorAndText(rotation.id);
 
       
 if(!orientation.value)
   {
     orientation.classList.add("green-light");
     orientation.classList.remove("red-light");
     orientation.classList.remove("purple-light");
 
   }
 
   else 
   {
     orientation.classList.remove("green-light");
     orientation.classList.add("red-light");
     orientation.classList.remove("purple-light");
 
   }
 
   changeColorAndText(orientation.id);
 
       
 if(!gripper.value)
   {
     gripper.classList.add("green-light");
     gripper.classList.remove("red-light");
     gripper.classList.remove("purple-light");
 
   }
 
   else 
   {
     gripper.classList.remove("green-light");
     gripper.classList.add("red-light");
     gripper.classList.remove("purple-light");
 
   }
 
   changeColorAndText(gripper.id);

   publisher=true;
   logContent = localStorage.getItem("logContent" );
   logContent = logContent + '\r\n';
}

  // fileMessage  '\n',
)

/////////////////////////////////////////////////////////////////////////////////
// Controller Leds Activation
/////////////////////////////////////////////////////////////////////////////////

document.addEventListener("DOMContentLoaded", function () {
  // Function to change color and text of the LED
  window.changeColorAndText = function (ledId) {
    // console.log("Changing LED color and text...");
    var led = document.getElementById(ledId)
    if (!led) {
      console.error("LED element not found.")
      return
    }
    var statusText = led.nextElementSibling


    if (led.classList.contains("green-light")) {
      localStorage.setItem("color", "green")
      statusText.textContent = "OK"
    } 
    else if (led.classList.contains("red-light")) {
      localStorage.setItem("color", "red")
      statusText.textContent = "FAULT"
    }

    else if (led.classList.contains("purple-light")) {
      // console.log("Changing LED to purple...")
      localStorage.setItem("color", "purple")
      statusText.textContent = "INVALID"
    }

  }
  // Attach click event listeners to the LEDs
  var leds = document.querySelectorAll(".colors")
  if (!leds || leds.length === 0) {
    console.error("No LEDs found.")
  } else {
    // console.log("Attaching event listeners to LEDs...")
    leds.forEach(function (led) {
      led.addEventListener("click", function () {
        // console.log("LED clicked:", this.id)
        changeColorAndText(this.id) // Pass the ID of the clicked LED
      })
    })
  }
 
    
  });
 
/////////////////////////////////////////////////////////////////////////////////
// USubscribing to a Topic
/////////////////////////////////////////////////////////////////////////////////

  // var PositionListener1 = new ROSLIB.Topic({
  //   ros : vueApp.ros,
  //   name : '/status',
  //   messageType : 'ases_mc_pkg1/status'
  // });

  // PositionListener1.subscribe(function(message) {
  //   document.getElementById("fPosx").value=message.Position_x.toFixed(2);
  //   document.getElementById("fPosy").value=message.Position_y.toFixed(2);
  //   document.getElementById("fPosz").value=message.Position_z.toFixed(2);
  //   document.getElementById("fOrientation").value=message.Position_o.toFixed(2);
  //   document.getElementById("fRotation").value=message.Position_r.toFixed(2);
  //   PositionListener1.unsubscribe();
  // });

/////////////////////////////////////////////////////////////////////////////////
// Subscribing to a Topic /Status
/////////////////////////////////////////////////////////////////////////////////
var gripStatus;
  var PositionListener = new ROSLIB.Topic({
    ros : vueApp.ros,
    name : '/status',
    messageType : 'ases_mc_pkg1/status'
  });

  PositionListener.subscribe(function(message) {
    // console.log('Received message on ' + PositionListener.name + ': ' + message.Position_x);
    document.getElementById("posxCur").value=message.Position_x.toFixed(2);
    document.getElementById("posyCur").value=message.Position_y.toFixed(2);
    document.getElementById("poszCur").value=message.Position_z.toFixed(2);
    document.getElementById("orientationCur").value=message.Position_o.toFixed(2);
    document.getElementById("rotationCur").value=message.Position_r.toFixed(2);
    gripStatus=parseInt(message.GR_g);
    switch(gripStatus)
    {
      case (0): //released
        {
          document.getElementById("release").disabled=true;
          document.getElementById("release").style.backgroundColor="lightgray";
          document.getElementById("release").style.color="darkgray";
          document.getElementById("grip").disabled=false;
          document.getElementById("grip").style.backgroundColor="#7e899a";
          document.getElementById("grip").style.color="white";

          document.getElementById("weldStart").disabled=true;
          document.getElementById("startJob").disabled=true;
          break;
        }
      case (1): //gripped
        {
          document.getElementById("grip").disabled=true;
          document.getElementById("grip").style.backgroundColor="lightgray";
          document.getElementById("grip").style.color="darkgray";
         
          document.getElementById("release").disabled=false;
          document.getElementById("release").style.backgroundColor="#7e899a";
          document.getElementById("release").style.color="white";
          if(autoJobSet){
          document.getElementById("weldStart").disabled=false;
          document.getElementById("startJob").disabled=false;
          }

          break;
        }
        case (2): //gripping
        {
          document.getElementById("grip").disabled=false;
          document.getElementById("grip").style.backgroundColor="yellow";
          document.getElementById("grip").style.color="black";

          document.getElementById("release").disabled=false;
          document.getElementById("release").style.backgroundColor="#7e899a";
          document.getElementById("release").style.color="white";
          document.getElementById("weldStart").disabled=true;
          document.getElementById("startJob").disabled=true;
          break;
        }
        case (3): //releasing
        {
          document.getElementById("release").disabled=false;
          document.getElementById("release").style.backgroundColor="yellow";
          document.getElementById("release").style.color="black";

          document.getElementById("grip").disabled=false;
          document.getElementById("grip").style.backgroundColor="#7e899a";
          document.getElementById("grip").style.color="white";

          document.getElementById("weldStart").disabled=true;
          document.getElementById("startJob").disabled=true;

          break;
        }
    }
    
  });

  
function clearLocalStorage() {
  console.log("Clearing localStorage...");
  localStorage.removeItem("logContent");

  // Clear the content of the log area (assuming its ID is 'textArea')
  document.getElementById("textArea").value = ""; // or .innerText = ""
}


/////////////////////////////////////////////////////////////////////////////////
// Utility Functions
/////////////////////////////////////////////////////////////////////////////////


// var logContent2 = localStorage.getItem("logContent");


// Function to create and download log file
function createAndDownloadLogFile() {
  if(fileMessage !== null){
    console.log('saving the log');
 
  fetch("http://localhost:3001/addLog", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ log: fileMessage, file: fileName, userid }),
  })
    .then((response) => {
      console.log(response);
    })
    .catch((error) => {
      console.error("Error saving log:", error);
    });
    fileMessage='';
  }
}

// Function to handle button click logging
function handleButtonClick(buttonName) {
  // const logBox = document.getElementById("textArea");
  const currentTime = new Date().toLocaleString();
  logMessage = `${currentTime}: ${buttonName} button clicked \n`;

  if(fileMessage==null)
    fileMessage = logMessage;
  else
  fileMessage = fileMessage + logMessage;
  logBox.value = logBox.value + logMessage;
  logBox.scrollTop=logBox.scrollHeight;
  
}
/////////////////////////////////////////////////////////////////////////////////
// Save Parameters
/////////////////////////////////////////////////////////////////////////////////

// document.getElementById("saveParam").addEventListener("click", (event)=> {
// var data={
// // Your save button click event listener
// fPosx: document.getElementById("fPosx").value,
// fPosy: document.getElementById("fPosy").value,
// fPosz: document.getElementById("fPosz").value,
// fOrientation: document.getElementById("fOrientation").value,

// // fRotation: document.getElementById("fRotation").value,
// // overLoop: document.getElementById("overLoop").value,
// // rpm: document.getElementById("rpm").value,
// }


//   saveFile();


//   var jsonData = JSON.stringify(data);
// var blob = new Blob([jsonData], { type: "text/plain;charset=utf-8" });

//   function saveFile(){
//     let fileName = prompt("Enter file name:", ".param");
//     if(!fileName){
//       return;
//     }
//     if (!fileName.endsWith("param")){
//       alert ("File format is not correct. Please use .param extension");
//       saveFile();
//       return;
//     }
  
//     var a = document.createElement("a");
//       a.style.display = "none";
  
  
//       a.href = window.URL.createObjectURL(blob);
//       a.download = fileName;
    
//       document.body.appendChild(a);
//       a.click();
//       document.body.removeChild(a);
//     }
//   });
  
  /////////////////////////////////////////////////////////////////////////////////
// Button Action Functions (Auto Job)
/////////////////////////////////////////////////////////////////////////////////


function changeOverloopFunc() {
  overLoop = document.getElementById("overLoop").value;
   document.getElementById("startJob").disabled=true;
  resetColor("overLoop");
  autoJobSet=false;
}

function changeRpmFunc() {
  rpm = document.getElementById("rpm").value;
  console.log("RPM Changed to " + rpm);
  resetColor("rpm");
  autoJobSet=false;
}

// var overLoopInput;
// var rpmInput;
// var testDone;
// var startButton = document.getElementById("startJob");
// var rot_final;

function testFunc() {
  console.log("Test Button Clicked");
  

  auto_request.overlap=overLoop;
    auto_request.rpm=rpm;
    auto_request.job='';

    auto_service.callService(auto_request, (result) => {
      vueApp.service_busy = false;
      vueApp.service_response = JSON.stringify(result);
      console.log("Test Run Service requested. Service result:" + vueApp.service_response);
  }, (error) => {
      vueApp.service_busy = false;
      console.error(error);
      console.log('error');
  });
// while(document.getElementById('rotationCur').value != rot_final);

  testDone=true;
  document.getElementById('startJob').disabled=false;


}

function setFunc() {
  
  overLoopInput = document.getElementById("overLoop");
  rpmInput = document.getElementById("rpm");

  overLoop = parseFloat(overLoopInput.value);
  rpm = parseFloat(rpmInput.value);
 //validate Inputs
  if(isNaN(overLoop || isNaN(rpm))){
    alert("please enter valid numeric values");
    return;
  }
  //change color
  overLoopInput.style.backgroundColor='green';
  rpmInput.style.backgroundColor='green';
  //Enable Start Button
  document.getElementById('startJob').disabled=false;
  autoJobSet=true;
}

function resetColor(inputId){
    const input = document.getElementById(inputId);
    input.style.backgroundColor = "";
    document.getElementById('startJob').disabled=true;
  }

document.getElementById('test').disabled=false;
testDone=false;

var auto_service=new ROSLIB.Service({
  ros: vueApp.ros,
  name: '/automatic_job_srv',
  serviceType: 'ases_mc_pkg1/automatic_job'  ,
  });
 

var auto_request = new ROSLIB.ServiceRequest({
    overlap:overLoop,
    rpm:rpm,
    job:'',         
  });
    

function startJobFunc() {
  if(confirm("You are going to perform Automatic Welding now. Click OK to proceed or Cancel to cancel")){
    //alert("Job Started");
    auto_request.overlap=overLoop;
    auto_request.rpm=rpm;
    auto_request.job='start job';

    auto_service.callService(auto_request, (result) => {
      vueApp.service_busy = false;
      vueApp.service_response = JSON.stringify(result);
      console.log("Auto Welding Job Started. Service result:" + vueApp.service_response);
  }, (error) => {
      vueApp.service_busy = false;
      console.error(error);
      console.log('error');
  });
    
  }
  else{
    alert("Job not started")
  }
  
  }


////////////////////////////////////////////////////////////////////////////////
// Proceed to Welding Position Service
/////////////////////////////////////////////////////////////////////////////////

function proceedToWeldingFunc() {
 
  clrFaultFunc();
  
 
  // pos_request.position_x = parseFloat(vueApp.fPosx);
  // pos_request.position_y = parseFloat(vueApp.fPosy);
  // pos_request.position_z = parseFloat(vueApp.fPosz);
  pos_request.position_x = parseFloat(document.getElementById("fPosx").value);
  pos_request.position_y = parseFloat(document.getElementById("fPosy").value);
  pos_request.position_z = parseFloat(document.getElementById("fPosz").value);
  pos_request.position_o = -1;
  pos_request.position_g = -1;
  pos_request.position_r = -1;
  
  // console.log("Fine X Changed to %f", pos_request.position_x);
   
  pos_service.callService(pos_request, (result) => {
      vueApp.service_busy = false;
      vueApp.service_response = JSON.stringify(result);
      clrFaultFunc();
  }, (error) => {
      vueApp.service_busy = false;
      console.error(error);
      console.log('error');
  });
  // welding_ON=1;
  // document.getElementById("grip").disabled=true;
  // document.getElementById("release").disabled=false;
}

/////////////////////////////////////////////////////////////////////////////////
// Welding Start & Stop Service
/////////////////////////////////////////////////////////////////////////////////

function weldStartFunc() {
  console.log("WELD Button Clicked");
  // setLogContent("WELD Button Clicked");

  welding_request.cmd_welding='ON';

  welding_service.callService(welding_request, (result) => {
    vueApp.service_busy = false;
    vueApp.service_response = JSON.stringify(result);
    console.log("welding ON success");
}, (error) => {
    vueApp.service_busy = false;
    console.error(error);
    console.log('error');
    // logTextarea.value += "Error: " + error + "\n";
});
 
}
//////////////////////////////////////////////////////////////////////////////
function weldStopFunc() {
  console.log("Stop Button Clicked");
  // setLogContent("Stop Button Clicked");

  welding_request.cmd_welding='OFF';

  welding_service.callService(welding_request, (result) => {
    vueApp.service_busy = false;
    vueApp.service_response = JSON.stringify(result);
    console.log("welding OFF success");
}, (error) => {
    vueApp.service_busy = false;
    console.error(error);
    console.log('error');
});
  
}
/////////////////////////////////////////////////////////////////////////////////////////
// Homing Button Functionality
/////////////////////////////////////////////////////////////////////////////////////////
home_service = new ROSLIB.Service({
  // ros: vueApp.ros,
  ros: vueApp.ros,
  name: "/homing_srv",
  serviceType: "ases_mc_pkg/homing"
})

home_request = new ROSLIB.ServiceRequest({
  // start: true
})

function homingFunc() {
  console.log("Homing Activated")
  confirm("Check the presence of capsule");
  
  home_service.callService(home_request,(result) => {
      vueApp.service_busy = false
      vueApp.service_response = JSON.stringify(result)
      console.log("Result for service call on " + home_service.name + result)
    },
    (error) => {
      vueApp.service_busy = false
      console.error(error)
    }
  )
  document.getElementById("fPosx").value=0.0;
  document.getElementById("fPosy").value=0;
  document.getElementById("fPosz").value=0;
  document.getElementById("fOrientation").value=90;
  document.getElementById("fRotation").value=0;
  document.getElementById("rotationCur").value=0;

  // vueApp.fPosx = 0.0;
  // vueApp.fPosy = 0;
  // vueApp.fPosz = 0;
  // vueApp.fOrientation = 90;
  // vueApp.fRotation = 0;

}
//////////////////////////////////////////////////////////////////////////////////////////
// Clear Fault Button Functionality
/////////////////////////////////////////////////////////////////////////////////////////

function clrFaultFunc() {
  console.log("Clear Fault Activated")
  clear_fault_service = new ROSLIB.Service({
    ros: vueApp.ros,
    name: "/clear_fault_srv",
    serviceType: "ases_mc_pkg/clearfault"
  })

  clrfault_request = new ROSLIB.ServiceRequest({
    // start: true
  })

  clear_fault_service.callService(
    clrfault_request,
    (result) => {
      vueApp.service_busy = false
      vueApp.service_response = JSON.stringify(result)
      console.log(
        "Result for service call on " + clear_fault_service.name + result)
    },
    (error) => {
      vueApp.service_busy = false
      console.error(error)
      console.log("Result awaited ")
    }
  )
}
//////////////////////////////////////////////////////////////////////////////////////////
// Reset All Button Functionality
/////////////////////////////////////////////////////////////////////////////////////////

function resetallFunc() {
  console.log("ResetAll Activated")
  resetall_service = new ROSLIB.Service({
    ros: vueApp.ros,
    name: "/reset_srv",
    serviceType: "ases_mc_pkg/resetall"
  })

  resetall_request = new ROSLIB.ServiceRequest({
    // start: true
  })

  resetall_service.callService(
    resetall_request,
    (result) => {
      vueApp.service_busy = false
      vueApp.service_response = JSON.stringify(result)
      console.log(
        "Result for service call on " + resetall_service.name + result
      )
    },
    (error) => {
      vueApp.service_busy = false
      console.error(error)
      console.log("Result awaited ")
    }
  )
}
/////////////////////////////////////////////////////////////////////////////////
//Positions Varaiables, Movement Service
/////////////////////////////////////////////////////////////////////////////////

function position_request(){
  Mode:'PPM',
  pos_request.position_x=vueApp.fPosx,
  pos_request.position_y=vueApp.fPosy,
  pos_request.position_z=vueApp.fPosz;

}

var pos_service=new ROSLIB.Service({
ros: vueApp.ros,
name: 'movement_srv',
serviceType: 'ases_mc_pkg/movement_srv'  ,
});

var pos_request = new ROSLIB.ServiceRequest({
  Mode:'PPM',
  position_x:vueApp.fPosx,
  position_y:vueApp.fPosy,
  position_z:vueApp.fPosz,
  position_o:vueApp.fOrientation,
  position_r:vueApp.fRotation,
  position_g:0,
  
});

var laser_service=new ROSLIB.Service({
  ros: vueApp.ros,
  name: 'laser_control_srv',
  serviceType: 'ases_mc_pkg/laser_control'  ,
  });
  
  var laser_request = new ROSLIB.ServiceRequest({
    cmd_lasercontrol:null,
  });
  
  var welding_service=new ROSLIB.Service({
    ros: vueApp.ros,
    name: 'welding_srv',
    serviceType: 'ases_mc_pkg1/welding'  ,
    });
    
    var welding_request = new ROSLIB.ServiceRequest({
      cmd_welding:null,
    });


function clrFaultFunc() {
  // console.log("Clear Fault Activated")
  clear_fault_service = new ROSLIB.Service({
    ros: vueApp.ros,
    name: "/clear_fault_srv",
    serviceType: "ases_mc_pkg/clearfault"
  })

  clrfault_request = new ROSLIB.ServiceRequest({
    // start: true
  })

  clear_fault_service.callService(
    clrfault_request,
    (result) => {
      vueApp.service_busy = false
      vueApp.service_response = JSON.stringify(result)
      
    },
    (error) => {
      vueApp.service_busy = false
      console.error(error)
      console.log("Result awaited ")
    },
  )
}
//////////////////////////////////////////////////

function changeFineXFunc() {
  //  clrFaultFunc();
  console.log("X changing");

  vueApp.fPosx = document.getElementById("fPosx").value;
  vueApp.fPosy = document.getElementById("fPosy").value;
  vueApp.fPosz = document.getElementById("fPosz").value;
 
  pos_request.position_x = parseFloat(vueApp.fPosx);
  pos_request.position_y = parseFloat(vueApp.fPosy);
  pos_request.position_z = parseFloat(vueApp.fPosz);
  pos_request.position_o = -1;
  pos_request.position_g = -1.0; 
  // pos_request.position_r = parseFloat(vueApp.fRotation);
  pos_request.position_r = -1;
  
  // console.log("Fine X Changed to %f", pos_request.position_x);
   
    // Assuming pos_service and pos_request are defined elsewhere in your code
  pos_service.callService(pos_request, (result) => {
      vueApp.service_busy = false;
      vueApp.service_response = JSON.stringify(result);
      // clrFaultFunc();
  }, (error) => {
      vueApp.service_busy = false;
      console.error(error);
      // console.log('error');
      // logTextarea.value += "Error: " + error + "\n";
  });
}

function changeFineYFunc() {
  // clrFaultFunc();
  console.log("Y changing");
  vueApp.fPosx = document.getElementById("fPosx").value;
  vueApp.fPosy = document.getElementById("fPosy").value;
  vueApp.fPosz = document.getElementById("fPosz").value;
 
  pos_request.position_x = parseFloat(vueApp.fPosx);
  pos_request.position_y = parseFloat(vueApp.fPosy);
  pos_request.position_z = parseFloat(vueApp.fPosz);
  pos_request.position_o = -1;
  pos_request.position_g = -1.0; 
  // pos_request.position_r = parseFloat(vueApp.fRotation);
  pos_request.position_r = -1;
  
  console.log("Fine Y Changed to %f", pos_request.position_y);
   
    // Assuming pos_service and pos_request are defined elsewhere in your code
  pos_service.callService(pos_request, (result) => {
    console.log("check");
      vueApp.service_busy = false;
      vueApp.service_response = JSON.stringify(result);
      // clrFaultFunc();
  }, (error) => {
      vueApp.service_busy = false;
      console.error(error);
      // console.log('error');
      // logTextarea.value += "Error: " + error + "\n";
  });
}

function changeFineZFunc() {
  // clrFaultFunc();
  console.log("Z changing");
  vueApp.fPosx = document.getElementById("fPosx").value;
  vueApp.fPosy = document.getElementById("fPosy").value;
  vueApp.fPosz = document.getElementById("fPosz").value;
 
  pos_request.position_x = parseFloat(vueApp.fPosx);
  pos_request.position_y = parseFloat(vueApp.fPosy);
  pos_request.position_z = parseFloat(vueApp.fPosz);
  pos_request.position_o = -1;
  pos_request.position_g = -1.0; 
  // pos_request.position_r = parseFloat(vueApp.fRotation);
  pos_request.position_r = -1;
  
  console.log("Fine Z Changed to %f", pos_request.position_z);
   
    // Assuming pos_service and pos_request are defined elsewhere in your code
  pos_service.callService(pos_request, (result) => {
      vueApp.service_busy = false;
      vueApp.service_response = JSON.stringify(result);
      // clrFaultFunc();
  }, (error) => {
      vueApp.service_busy = false;
      console.error(error);
      // console.log('error');
      logTextarea.value += "Error: " + error + "\n";
  });
}

function changeFineOrientFunc(){
  // clrFaultFunc();
  console.log("Orientation changing");
  vueApp.fOrientation = document.getElementById("fOrientation").value;
  pos_request.position_o = parseFloat(vueApp.fOrientation);
  pos_request.position_x = -1;
  pos_request.position_y = -1;
  pos_request.position_z = -1;
  // pos_request.position_o = -1.0;
  pos_request.position_g = -1.0;
  pos_request.position_r = -1;
  
  console.log("Fine Orientation Changed ", pos_request.position_o);
   
  pos_service.callService(pos_request, (result) => {
      vueApp.service_busy = false;
      vueApp.service_response = JSON.stringify(result);
      // clrFaultFunc();
      // console.log('check');
  }, (error) => {
      vueApp.service_busy = false;
      console.error(error);
      // console.log('error');
  });
}

function changeFineRotationFunc(){
  // clrFaultFunc();

  console.log("Rotation changing");
  vueApp.fRotation = document.getElementById("fRotation").value;
  pos_request.position_r = parseFloat(vueApp.fRotation);
  pos_request.position_x = -1;
  pos_request.position_y = -1;
  pos_request.position_z = -1;
  pos_request.position_o = -1;
  pos_request.position_g = -1.0;
  // pos_request.position_r = -1.0;
  
  console.log("Fine Rotation Changed ", pos_request.position_r);
   
  pos_service.callService(pos_request, (result) => {
      vueApp.service_busy = false;
      vueApp.service_response = JSON.stringify(result);
      // clrFaultFunc();
      // console.log('check');
  }, (error) => {
      vueApp.service_busy = false;
      console.error(error);
      // console.log('error');
  });
}

/////////////////////////////////////////////////////////////////////////////////
// Parking Service
/////////////////////////////////////////////////////////////////////////////////

function parkingFunc() {
  // clrFaultFunc();
  // console.log("Clear Fault Activated")
  parking_service = new ROSLIB.Service({
    ros: vueApp.ros,
    name: "/parking_srv",
    serviceType: "std_srvs/Trigger"
  })

  parking_request = new ROSLIB.ServiceRequest({
    // start: true
  })

  parking_service.callService(
    parking_request,
    (result) => {
      vueApp.service_busy = false
      vueApp.service_response = JSON.stringify(result)
      // console.log(
      //   "Result for service call on " + clear_fault_service.name + result)
    },
    (error) => {
      vueApp.service_busy = false
      console.error(error)
      console.log("Result awaited ")
    }
  )

  // //Read current values 
  // var xCur=parseFloat(document.getElementById("posxCur").value);
  // var yCur=parseFloat(document.getElementById("posyCur").value);
  // var zCur=parseFloat(document.getElementById("poszCur").value); 
  // while((xCur>5))
  //   {
  //     console.log("Current X position is ", xCur);
  //     xCur=parseFloat(document.getElementById("posxCur").value);
  //     yCur=parseFloat(document.getElementById("posyCur").value);
  //     zCur=parseFloat(document.getElementById("poszCur").value);
      
  //   }
    
  clrFaultFunc();
  // welding_ON=0;
  // document.getElementById("grip").disabled=false;
  // document.getElementById("release").disabled=true;

}

/////////////////////////////////////////////////////////////////////////////////
// Emergency Stop Service
/////////////////////////////////////////////////////////////////////////////////
function eStopFunc() {
  // setLogContent("Emergency Stop Button Clicked");
  weldStopFunc();
  console.log("EStop Activated")
  estop_service = new ROSLIB.Service({
    ros: vueApp.ros,
    name: "/quickstop_srv",
    serviceType: "ases_mc_pkg/estop"
  })

  estop_request = new ROSLIB.ServiceRequest({
    // start: true
  })

  estop_service.callService(
    estop_request,
    (result) => {
      vueApp.service_busy = false
      vueApp.service_response = JSON.stringify(result)
      console.log("Result for service call on " + estop_service.name + result)
    },
    (error) => {
      vueApp.service_busy = false
      console.error(error)
      console.log("EStop awaited ")
    }
  )
}
/////////////////////////////////////////////////////////////////////////////////
// Grip & Release Service
/////////////////////////////////////////////////////////////////////////////////
var grip_command;

var grip_service=new ROSLIB.Service({
  ros: vueApp.ros,
  name: '/grip_release_srv',
  serviceType: 'ases_mc_pkg1/grip_release'  ,
  });
  
  var grip_request = new ROSLIB.ServiceRequest({
    command:"",
    
  });

function gripFunc() {
  // clrFaultFunc();
  console.log("Grip Button Clicked");
  
  // pos_request.position_g = 0.0;
  // pos_request.position_x = -1.0;
  // pos_request.position_y = -1.0;
  // pos_request.position_z = -1.0;
  // pos_request.position_o = -1.0;
  // // pos_request.position_g = -1.0;
  // pos_request.position_r = -1.0;
  grip_request.command="grip";
  console.log( pos_request.position_g);
   
    // Assuming pos_service and pos_request are defined elsewhere in your code
  grip_service.callService(grip_request, (result) => {
      vueApp.service_busy = false;
      vueApp.service_response = JSON.stringify(result);
      clrFaultFunc();
  }, (error) => {
      vueApp.service_busy = false;
      console.error(error);
      console.log('error');
      // logTextarea.value += "Error: " + error + "\n";
  });
  // grip_release=1;
  // document.getElementById("grip").disabled=true;
  // document.getElementById("release").disabled=false;

}
function releaseFunc() {
  // clrFaultFunc();
  console.log("Release Button Clicked");
  // setLogContent("Release Button Clicked");

  // pos_request.position_g = -80000;
  // pos_request.position_x = -1.0;
  // pos_request.position_y = -1.0;
  // pos_request.position_z = -1.0;
  // pos_request.position_o = -1.0;
  // // pos_request.position_g = -1.0;
  // pos_request.position_r = -1.0;
  console.log( pos_request.position_g);
  grip_request.command="release"; 
    // Assuming pos_service and pos_request are defined elsewhere in your code
  grip_service.callService(grip_request, (result) => {
      vueApp.service_busy = false;
      vueApp.service_response = JSON.stringify(result);
      clrFaultFunc();
  }, (error) => {
      vueApp.service_busy = false;
      console.error(error);
      console.log('error');
      // logTextarea.value += "Error: " + error + "\n";
  });
  // grip_release=0;
  // document.getElementById("grip").disabled=false;
  // document.getElementById("release").disabled=true;
  
}

/////////////////////////////////////////////////////////////////////////////////
// Laser On & Off Service
/////////////////////////////////////////////////////////////////////////////////

let laser_ON =0;
function toggleLaser(){
  document.getElementById("laserOn").disabled = (laser_ON ===1);
  document.getElementById("laserOff").disabled = (laser_ON ===0);
}

function laserOnFunc() {
  console.log("Laser On Button Clicked");
  laser_ON = 1;
  toggleLaser();
  laser_request.cmd_lasercontrol='ON';

  laser_service.callService(laser_request, (result) => {
    vueApp.service_busy = false;
    vueApp.service_response = JSON.stringify(result);
    console.log("laser ON success");
    toggleLaser(1);
}, (error) => {
    vueApp.service_busy = false;
    console.error(error);
    console.log('error');
    // logTextarea.value += "Error: " + error + "\n";
});
   
}

function laserOffFunc() {
  console.log("Laser Off Button Clicked");
  laser_ON = 0;
  toggleLaser();
  laser_request.cmd_lasercontrol='OFF';

  laser_service.callService(laser_request, (result) => {
    vueApp.service_busy = false;
    vueApp.service_response = JSON.stringify(result);
    console.log("laser OFF success");
    toggleLaser(0);
}, (error) => {
    vueApp.service_busy = false;
    console.error(error);
    console.log('error');
    // logTextarea.value += "Error: " + error + "\n";
});
}
document.addEventListener("DOMContentLoaded", function(){
  toggleLaser();

  document.getElementById("laserOn").addEventListener("click", laserOnFunc);
  document.getElementById("laserOff").addEventListener("click", laserOffFunc);

})
/////////////////////////////////////////////////////////////////////////////////
// Position Control Functions
/////////////////////////////////////////////////////////////////////////////////

function handleInputChange(inputElement, identifier) {
  var position = inputElement.value;
  var formattedDate = new Date().toLocaleString();
  var logMessage = `${formattedDate} - ${identifier} Changed to: ${position}\n`;
  logBox.scrollTop=logBox.scrollHeight;

  console.log(logMessage);

  var logTextarea = document.getElementById("textArea");
  logTextarea.value += logMessage;

  if (identifier === "fPosx") {
    vueApp.fPosx = position;
  } else if (identifier === "fPosy") {
    vueApp.fPosy = position;
  } else if (identifier === "fPosz") {
    vueApp.fPosz = position;
  } else if (identifier === "fOrientation") {
    vueApp.fOrientation = position;
  } else if (identifier === "fRotation") {
    vueApp.fRotation = position;
  } else if (identifier === "rpm") {
    vueApp.rpm = position;
  }
}

////////////////////////////////////////////////////////////////////////////////
async function createNewLogFile () {
  const userid = localStorage.getItem("userid")
  const message = getPreviousLogContent();
  console.log(message, typeof(message))
  return fetch('http://localhost:3001/create-log', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ userid, message }),
})
  .then(response =>{
    window.alert("Log created successfully");
     response.json()
    }
    ).then(data => console.log(data))
  .catch(error => {
    window.alert("Failed to create log")
    console.error('Error creating log:', error)});
}
/////////////////////////////////////////////////////////////////////////////////
// Button Action Functions
/////////////////////////////////////////////////////////////////////////////////

function disableInputs() {
  document.getElementById("overLoop").disabled = true;
  document.getElementById("rpm").disabled = true;
  document.getElementById("startJob").disabled = false;
}

function enableStart() {
  setTimeout(function () {
    document.getElementById("overLoop").disabled = false;
    document.getElementById("rpm").disabled = false;
    document.getElementById("startJob").disabled = true;
  }, 3000);
}

// Event listeners for buttons
document.getElementById("saveParam").addEventListener("click", async function () {
  var data = {
    fPosx: document.getElementById("fPosx").value,
    fPosy: document.getElementById("fPosy").value,
    fPosz: document.getElementById("fPosz").value,
    fOrientation: document.getElementById("fOrientation").value,
    fRotation: document.getElementById("fRotation").value,
    // overLoop: document.getElementById("overLoop").value,
    // rpm: document.getElementById("rpm").value,
  };

  var jsonData = JSON.stringify(data);

  function saveFile() {
    let fileName = prompt("Enter file name:", ".param");
    if(!fileName){
      return;
    }
    if (!fileName.endsWith("param")){
      alert ("File format is not correct. Please use .param extension");
      saveFile();
      return;
    }
    var blob= new Blob([jsonData],{type:'application/json'});
     var a = document.createElement("a");
      a.style.display = "none"; 
      a.href = window.URL.createObjectURL(blob);
      a.download = fileName;  
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
    }
    saveFile();
});

// LED Activation
document
  .querySelector(".colors-grid")
  .addEventListener("click", function (event) {
    if (event.target.classList.contains("colors")) {
      event.target.classList.toggle("red-light");
      event.target.classList.toggle("green-light");
      var statusText = event.target.nextElementSibling;
      statusText.textContent = statusText.textContent === "OFF" ? "ON" : "OFF";
    }
  });


var exit_return = 0;

function showModal() {
  return new Promise((resolve, reject)=>{
 
 // Modal functionality
var modal = document.getElementById("myModal");
var span1 = document.getElementsByClassName("close")[0];
var shutDownButton = document.getElementById("shutDownButton");
var logoutButton = document.getElementById("logoutButton");
var closeButton = document.querySelector('.close');

// var homeButton = document.getElementById("homeButton");
var cancelButton = document.getElementById("cancelButton");

  modal.style.display = "block";
  closeButton.onclick=function(){
  modal.style.display='none';
  exit_return=0;
  reject("Modal close without confirming");
}

  shutDownButton.onclick = function () {
    // window.location.href = "index.html";
    // history.back();
    exit_return=2;
    console.log("ShutDown is called")
    resolve('Shutdown called');
  };
  
  logoutButton.onclick = function () {
    modal.style.display = "none";
    // window.location.href = "index.html";
    //localStorage.clear();
    exit_return=1;
    resolve("Logout called");
  };
  
  cancelButton.onclick = function () {
    modal.style.display = "none";
    // window.location.href = "index.html";
    //localStorage.clear();
    exit_return=0;
    reject("Cancelled Exit");
  };
  });
}

span1.onclick = function () {
  modal.style.display = "none";
};



async function exitFunc() {
  const result = await showModal();
  handleButtonClick("EXIT");
  console.log("Exit option chosen ", exit_return)

  if(exit_return!=0){
  weldStopFunc();
  console.log("Welding Torch turned OFF");

  parkingFunc();

  // //Read current values 
  // var xCur=parseFloat(document.getElementById("posxCur").value);
  // var yCur=parseFloat(document.getElementById("posyCur").value);
  // var zCur=parseFloat(document.getElementById("poszCur").value);

  
  // while((xCur>5))
  //   {
  //     console.log("Current X position is ", xCur);
  //     xCur=parseFloat(document.getElementById("posxCur").value);
  //     yCur=parseFloat(document.getElementById("posyCur").value);
  //     zCur=parseFloat(document.getElementById("poszCur").value);
  //   }
    
    laserOffFunc();
    console.log("Laser Turned OFF");
    
        //release gripper
    grip_request.command="release";
  
    grip_service.callService(grip_request, (result) => {
      vueApp.service_busy = false;
      vueApp.service_response = JSON.stringify(result);
      clrFaultFunc();
  }, (error) => {
      vueApp.service_busy = false;
      console.error(error);
      console.log('error');
      // logTextarea.value += "Error: " + error + "\n";
  });

  //change orientation to zero
  console.log("Changing Orientation to Zero position");
  
  pos_request.position_o = 0;
  pos_request.position_x = -1;
  pos_request.position_y = -1;
  pos_request.position_z = -1;
  // pos_request.position_o = -1.0;
  pos_request.position_g = -1.0;
  pos_request.position_r = -1;

  pos_service.callService(pos_request, (result) => {
      vueApp.service_busy = false;
      vueApp.service_response = JSON.stringify(result);
      // clrFaultFunc();
      // console.log('check');
  }, (error) => {
      vueApp.service_busy = false;
      console.error(error);
      // console.log('error');
  });
  if(exit_return==1)
    {
      localStorage.clear();
      window.location.href = "index.html";

  
    }
    // if(exit_return==2)
    else{
     { localStorage.clear();
      window.location.href = "index.html";
    }
  }
}
}

function createLog() {
  handleButtonClick("CREATE LOG BUTTON");
}

/////////////////////////////////////////////

// let recorder;
// let isRecording = false;
// let isPaused = false;

function startRecording(cameraFeedUrl) {

  fetch("http://localhost:3001/startRecording", {
    method: "GET",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({cameraFeedUrl, cam1FileName}),
   
  })
    .then((response) => {
      console.log(response);
      console.log("Camera1");
    })
    .catch((error) => {
      console.error("Error saving log:", error);
    });
    
  }
///////////////////////////////////////////////////////////////////////////////////////
////Cancel Button Functionality
//////////////////////////////////////////////////////////////////////////////////////

// document.addEventListener("DOMContentLoaded", function () {
//   const cancelButton = document.getElementById("cancelButton")
//   const modal = document.getElementById("myModal2")
//   const yesButton = document.getElementById("yesmodalButton")
//   const noButton = document.getElementById("nomodalButton")

//   // Add click event listener to the exit button
//   cancelButton.addEventListener("click", function () {
//     // Display the confirmation modal
//     // modal.style.display = "block"
//     // cancelFunc();
//     // modal.style.display = "none"
//     exitFunc.style.display="none"
//   })

//   // Add click event listener to the "Yes" button in the confirmation modal
//   yesButton.addEventListener("click", function () {
//     // Hide both modals if "Yes" is clicked
//     modal.style.display = "none"
//   })

//   // Add click event listener to the "No" button in the confirmation modal
//   noButton.addEventListener("click", function () {
//     // Hide only the confirmation modal if "No" is clicked
//     modal.style.display = "none"
//   })
// })

///////////////////////////////////////////////////////////////////
// Modal Code Behind Exit Button
/////////////////////////////////////////////////////////////////////

function cancelFunc() {
  var cancelButton = document.getElementById("cancelButton");
  var modal = document.getElementById("myModal2");
  var closeButton = document.querySelector("#myModal2 .close");
  var yesButton = document.getElementById("yesExitButton");
  var noButton = document.getElementById("noExitButton");

  // Open the exit modal
  closeButton.onclick = function () {
      modal.style.display = "block"; // Show modal for confirmation
  };

  // Close the modal if clicked outside the modal content
  window.onclick = function (event) {
      if (event.target == modal) {
          modal.style.display = "none";
      }
  };

  // Close the modal if the close button is clicked
  closeButton.onclick = function () {
      modal.style.display = "none";
  };

  // Handle Yes button click
  yesButton.onclick = function () {
      modal.style.display = "none";
      window.location.href = "index.html"; // Navigate to the homepage
  };

  // Handle No button click
  noButton.onclick = function () {
      modal.style.display = "none";
  };
  handleButtonClick("CANCEL");
  
}

// history.back()
