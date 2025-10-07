const cam2IP = '192.168.0.90'
const cam1IP = '192.168.1.89'
var sessionName;
const logPeriod = 5;

var userid;
var fileName;
var logBox = document.getElementById("log");

var message = '';
var logMessage = '';
var fileMessage = '';

var urlParams = new URLSearchParams();
var params=null;

/////////////////////////////////////////////////////////////////////////////////////////
///Publisher not publishing data
/////////////////////////////////////////////////////////////////////////////////////////

var publisher =false;

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

fetch('http://localhost:3001/pingCamera', {
  method: 'POST',
  headers: {
      'Content-Type': 'application/json'
  },
  body: JSON.stringify({ CameraIP: cam2IP })
})
.then(response => {
if (!response.ok) {
  throw new Error('Network response was not ok');
}
return response.json(); // Parse the response as JSON
})


.then(data => {
if (typeof data === 'boolean') { // Ensure the data is a boolean
  // console.log('Received boolean data:', data);

  if (data) {
    // console.log('The boolean value2 is true');
    // Handle the true case
    cam2.classList.add("green-light");  
    cam2.classList.remove("purple-light");
    cam2.classList.remove("red-light"); 
    changeColorAndText(cam2.id);
    
  } else {
    // console.log('The boolean value is false');
    // Handle the false case
    cam2.classList.add("red-light");  
    cam2.classList.remove("green-light");
    cam2.classList.remove("purple-light"); 
    changeColorAndText(cam2.id);
  }
} else {
  console.error('Unexpected data type:', typeof data);
}
})

.catch(error => console.error('Error:', error));


fetch('http://localhost:3001/pingCamera', {
  method: 'POST',
  headers: {
      'Content-Type': 'application/json'
  },
  body: JSON.stringify({ CameraIP: cam1IP })
})
.then(response => {
if (!response.ok) {
  throw new Error('Network response was not ok');
}
return response.json(); // Parse the response as JSON
})


.then(data => {
if (typeof data === 'boolean') { // Ensure the data is a boolean
  // console.log('Received boolean data:', data);

  if (data) {
    // console.log('The boolean value2 is true');
    // Handle the true case
    cam1.classList.add("green-light");  
    cam1.classList.remove("purple-light");
    cam1.classList.remove("red-light"); 
    changeColorAndText(cam1.id);
    
  } else {
    // console.log('The boolean value is false');
    // Handle the false case
    cam1.classList.add("red-light");  
    cam1.classList.remove("green-light");
    cam1.classList.remove("purple-light"); 
    changeColorAndText(cam1.id);
  }
} else {
  console.error('Unexpected data type:', typeof data);
}
})

.catch(error => console.error('Error:', error));
  publisher=false;
}
 

/////////////////////////////////////////////////////////////////////////////////////////
///Log Messages
/////////////////////////////////////////////////////////////////////////////////////////
  

function handleButtonClick(buttonName) {
  var currentTime = new Date();
  var formattedTime = currentTime.toLocaleString();
  message = '\r\n' + formattedTime + ": " + buttonName + " button clicked"
  // logBox.innerHTML = logBox.innerHTML + '\r\n' + message;  
  var logMessageHTML = "<div>" + message + "</div>";
  // logBox.textContent=logBox.textContent+message;
  logBox.innerHTML = logBox.innerHTML + logMessageHTML;
  logBox.scrollTop=logBox.scrollHeight;

  fileMessage = fileMessage + message;
  // logMessage =  logMessage + message
  
  
  
}


////////////////////////////////////////////////////////////////////////////////////////
//Check if User Exist
/////////////////////////////////////////////////////////////////////////////////////////

window.onload = function () {
  userid = localStorage.getItem("userid");
  sessionName=localStorage.getItem("fileName");
  fileName = sessionName+".elog"; 
  setInterval(checkPublisher, 1000)
  setInterval(saveLogToFile, logPeriod*1000)

  window.history.pushState(null, null, window.location.href);
    window.onpopstate = function () {
        window.history.go(1);}

/////////////////////////////////////////////////////////////////////////////////////////
  // Subscribing to Topic /errormsg
/////////////////////////////////////////////////////////////////////////////////////////

// fileMessage = localStorage.getItem("loginMessage");
// saveLogToFile();

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
  var logMessageHTML = "<div>" + message + "</div>";
  // logBox.textContent=logBox.textContent+message;
  logBox.innerHTML = logBox.innerHTML + logMessageHTML;
  logBox.scrollTop=logBox.scrollHeight;
  fileMessage = fileMessage + message;
})


var loginMessage = localStorage.getItem("loginMessage")
// Check if login message exists
if (loginMessage) {
  console.log(loginMessage)
  var log = document.getElementById("log")
  var messageDiv = document.createElement("div")
  messageDiv.textContent = "" + loginMessage // Add a line break before the message
  // log.appendChild(messageDiv)
} else {
  alert("No user login details found. Please log in.")
  // Redirect to the login page or handle accordingly
}
};
/////////////////////////////////////////////////////////////////////////////////////////
///Leds Activation (Vision & Controller)
/////////////////////////////////////////////////////////////////////////////////////////

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
      // console.log("Changing LED to green...")
      localStorage.setItem("color", "green")
      statusText.textContent = "OK"

    } else if (led.classList.contains("red-light")) {
      // console.log("Changing LED to red...")
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
  var leds = document.querySelectorAll(".circle")
  if (!leds || leds.length === 0) {
    console.error("No LEDs found.")
  } else {
    console.log("Attaching event listeners to LEDs...")
    leds.forEach(function (led) {
      led.addEventListener("click", function () {
        console.log("LED clicked:", this.id)
        changeColorAndText(this.id) // Pass the ID of the clicked LED
      })
    })
  } 
    
  });
  // Function to handle connect button click
  function connectAndChangeLEDs() {
    // handleButtonClick("CONNECT")
    //find all divs whose onclick is changeColorAndText
    var leds = document.querySelectorAll(".circle");
    leds.forEach(function (led) {
      changeColorAndText(led.id);
    });
    // Attach click event listener to the connect button
    var connectButton = document.getElementById("disconnect")
    if (!connectButton) {
        console.error("Connect button not found.")
    } else {
        console.log("Attaching event listener to connect button...");
        // connectButton.addEventListener("click", connectAndChangeLEDs)
    };
    
  }
/////////////////////////////////////////////////////////////////////////////////////////
  // Subscribing to Topic /state
/////////////////////////////////////////////////////////////////////////////////////////
  
  var LedListener = new ROSLIB.Topic({
    ros : vueApp.ros,
    name : '/state',
    messageType : 'ases_mc_pkg1/state'
  });

  
// /////////////////////////////////////////////////////////////////////////////////
// Function to handle Connect button and Disconnect confirmation
////////////////////////////////////////////////////////////////////////////////////
function disconnectConfirm() {
  var connectButton = document.getElementById("disconnect");
  var modal = document.getElementById("myModal1");
  var closeButton = document.querySelector("#myModal1 .close");
  var yesButton = document.getElementById("yesButton");
  var noButton = document.getElementById("noButton");

  if (connectButton.textContent === "DISCONNECT") {
      modal.style.display = "block"; // Show modal for confirmation
  } else {
      connectButton.textContent = "DISCONNECT";
      connectButton.style.backgroundColor = "green";
      LedListener.subscribe(function(message) {
        // console.log('Received message on ' + LedListener.name + ': ' + message.x);
        document.getElementById("linx").value= message.x ;
        document.getElementById("liny").value= message.y ;
        document.getElementById("linz").value= message.z ;
        document.getElementById("rotation").value= message.r ;
        document.getElementById("orientation").value= message.o ;
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
     
      });
  }

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
      connectButton.textContent = "CONNECT";
      
      connectButton.style.backgroundColor = ""; // Reset button style
      localStorage.clear(); // Clear localStorage (if needed)
      // Navigate to the login screen (index.html)
      disableButtons();     
      LedListener.unsubscribe();
     };

  // Handle No button click
  noButton.onclick = function () {
      modal.style.display = "none";
  };
}

///////// /// ////////////////////////////////////////////////
//Enabling Buttons by pressing Connect Button
///////// /// ////////////////////////////////////////////////

function enableButtons() {
  var homingButton = document.getElementById("homing")
  var clrfaultButton = document.getElementById("clrfault")
  var resetallButton = document.getElementById("resetall")
  var loadparamButton = document.getElementById("loadparam")
  var proceedButton = document.getElementById("proceed")

  // Enable the buttons
  homingButton.disabled = false
  clrfaultButton.disabled = false
  resetallButton.disabled = false
  loadparamButton.disabled = false
  proceedButton.disabled = false
}

function disableButtons() {
  var homingButton = document.getElementById("homing")
  var clrfaultButton = document.getElementById("clrfault")
  var resetallButton = document.getElementById("resetall")
  var loadparamButton = document.getElementById("loadparam")
  var proceedButton = document.getElementById("proceed")

  // Enable the buttons
  homingButton.disabled = true
  clrfaultButton.disabled = true
  resetallButton.disabled = true
  loadparamButton.disabled = true
  proceedButton.disabled = true
}
////////////////////////////////////////////////////////////////////
// Modal Code Behind Exit Button
/////////////////////////////////////////////////////////////////////

function exitConfirm() {
  var exitButton = document.getElementById("exit");
  var modal = document.getElementById("myModal2");
  var closeButton = document.querySelector("#myModal2 .close");
  var yesButton = document.getElementById("yesExitButton");
  var noButton = document.getElementById("noExitButton");
  modal.style.display = "block";

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
}

  
  
/////////////////////////////////////////////////////////////////////////
// Function to save log to a file
///////////////////////////////////////////////////////////////////////////

function saveLogToFile() {
  // Get log content
  // const logContent = document.getElementById("log").innerText;
  // const userid = localStorage.getItem("userid");

  // Get filename from localStorage
  // const fileName = localStorage.getItem("fileName")

  fetch("http://localhost:3001/addLog", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      log: fileMessage,
      file: fileName
    })
  })
    .then((response) => {
      if (response.ok) {
        // window.location.href = "optscreen.html"
        fileMessage = '';
      } else {
        throw new Error("Failed to save log")
      }
    })
    .catch((error) => {
      console.error("Error saving log:", error)
      alert("Error saving log.")
    })
}

/////////////////////////////////////////////////////////////////////////////////////////
// View Log Button Functionality
/////////////////////////////////////////////////////////////////////////////////////////

// Function to reset file input and open browser
function openBrowser() {
  document.getElementById("fileBrowser").style.display = "none";
  document.getElementById("logFileInput").click();
 }

// Function to handle file selection and open in new tab

function handleViewLog() {
  handleButtonClick("VIEW LOG");
 }
 
// Function to reset file input
function resetFileInput() {
  var fileInput = document.getElementById("logFileInput");
  fileInput.value = ""; // Clear the file input
  fileInput.style.display = "none"; // Hide the file input after use
}

// Function to reset file input and open browser
function openBrowser() {
  var fileInput = document.createElement("input");
  fileInput.type = "file";
  fileInput.style.display = "none";
  fileInput.onchange = handleFileSelectview; // Attach the onchange handler
  fileInput.id = "logFileInput"; // Assign the same id to the new file input

  var oldFileInput = document.getElementById("logFileInput");
  oldFileInput.parentNode.replaceChild(fileInput, oldFileInput);

  fileInput.click(); // Trigger the click event on the new file input to open the file browser
}

// Function to handle file selection and open in new tab
function handleFileSelectview() {
  const selectedFile = document.getElementById("logFileInput").files[0];
  const reader = new FileReader();

  reader.onload = function(e) {
    
    if (selectedFile.name.endsWith(".elog")){
      var openedTab = window.open();
      openedTab.document.write("<pre>" + e.target.result + "</pre>");
      openedTab.document.close();
    } else {
      alert("Selected file does not match the selected date.");
    }

    resetFileInput();
    document.getElementById("fileBrowser").style.display = "none";
  };

  reader.readAsText(selectedFile);
}

/////////////////////////////////////////////////////////////////////////////////////////
///Loading parameters file
/////////////////////////////////////////////////////////////////////////////////////////

// Function to handle the "LOAD PARAM" button click
function loadParameterFile() {
  handleButtonClick("LOAD PARAMETER");

  // Open file dialog
   document.getElementById("paramFile").click()
   document.getElementById("paramFile").addEventListener("change", handleFileSelect)
}

// Event listener for file input change
function handleFileSelect(event) {
  
  const file = event.target.files[0]
  if (file) {
    if (file.name.endsWith(".param")) {
      const reader = new FileReader();
      reader.onload = function (e) {
        try {
          params = JSON.parse(e.target.result);
          enableProceedButton(params);
          console.log('My Test');
          alert("File loaded successfully!")
        
        } catch (error) {
          console.error("Invalid parameter file. File format mismatch:", error)
        }
      }
      reader.readAsText(file)
    } else {
      alert("Please select a valid .param file.")
    }
  }
}

/////////////////////////////////////////////////////////////////////////////////////////
///Enabling Proceed Button to move Operation Screen
/////////////////////////////////////////////////////////////////////////////////////////
var urlParams = new URLSearchParams();

function enableProceedButton(params) {
  const proceedButton = document.getElementById("proceed");
  
    
  urlParams.append("fPosx", params.fPosx);
  urlParams.append("fPosy", params.fPosy);
  urlParams.append("fPosz", params.fPosz);
  urlParams.append("fOrientation", params.fOrientation);
  urlParams.append("fRotation", params.fRotation);
  // urlParams.append("overLoop", params.overLoop);
  // urlParams.append("rpm", params.rpm);    

  // proceedButton.onclick = function(){
  //   proceed();
  // };
  console.log(urlParams);
  localStorage.setItem("parameters",urlParams);
  proceedButton.disabled = false;

}

function writeFile(){
      // Construct the URL with parameters and redirect to next_page.html
    
    console.log(fileMessage);
      fetch("http://localhost:3001/addLog", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ log: fileMessage, file: fileName, userid }),
    })
      .then((response) => {
        console.log("Log added:", response);
      })
      .catch((error) => {
        console.error("Error adding log:", error);
      });
      fileMessage='';
    };

function proceed(){
    console.log('proceed');
    // writeFile();
    localStorage.setItem("fileName", sessionName);
    window.location.href = "optscreen.html?" + urlParams.toString();
  };
///////////////////////////////////////////////////////////////////////////////////////
////User Management Exit Button Functionality
//////////////////////////////////////////////////////////////////////////////////////

document.addEventListener("DOMContentLoaded", function () {
  const exitButton = document.getElementById("exitModalButton")
  const modal = document.getElementById("myModal2")
  const yesButton = document.getElementById("yesmodalButton")
  const noButton = document.getElementById("nomodalButton")

  // Add click event listener to the exit button
  exitButton.addEventListener("click", function () {
    // Display the confirmation modal
    modal.style.display = "block"
  })

  // Add click event listener to the "Yes" button in the confirmation modal
  yesButton.addEventListener("click", function () {
    // Hide both modals if "Yes" is clicked
    modal.style.display = "none"
    userManagementModal.style.display = "none"
  })

  // Add click event listener to the "No" button in the confirmation modal
  noButton.addEventListener("click", function () {
    // Hide only the confirmation modal if "No" is clicked
    modal.style.display = "none"
  })
})

/////////////////////////////////////////////////////////////////////////////////////////
// Homing Button Functionality
/////////////////////////////////////////////////////////////////////////////////////////
function homingFunc() {
  console.log("Homing Activated")
  home_service = new ROSLIB.Service({
    // ros: vueApp.ros,
    ros: vueApp.ros,
    name: "/homing_srv",
    serviceType: "ases_mc_pkg/homing"
  })
  home_request = new ROSLIB.ServiceRequest({
    // start: true
  })
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
}
//////////////////////////////////////////////////////////////////////////////////////////
// Clear Fault Button Functionality
/////////////////////////////////////////////////////////////////////////////////////////

function clrFaultFunc() {
  console.log("Clear Fault Activated")
  clear_fault_service = new ROSLIB.Service({
    ros: vueApp.ros,
    name: "/clear_fault_srv",
    serviceType: "ases_mc_pkg/clearfault",
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

//////////////////////////////////////////////////////////////////////////////////////////
// Emergency Stop Button Functionality
/////////////////////////////////////////////////////////////////////////////////////////

function estopFunc() {
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
