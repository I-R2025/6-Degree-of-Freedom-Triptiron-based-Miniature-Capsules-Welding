var fileName;
var userId, password;
var timestamp, loginMessage;
//Toggle Eye Icon
function togglePasswordVisibility() {
  var passwordInput = document.getElementById("password");
  var eyeIcon = document.querySelector(".icon1");

  if (passwordInput.type === "password") {
    passwordInput.type = "text";
    eyeIcon.src = "img/eye-show.png"; // Change the source to the eye-off icon
  } else {
    passwordInput.type = "password";
    eyeIcon.src = "img/eye-hide.png"; // Change the source back to the eye icon
  }
}

//////////////NEw code added//

async function authenticateUserAndCreateLogFile() {
   userid = document.getElementById("userid").value;
   password = document.getElementById("password").value;

  try {
    const response = await fetch("users.json");
    if (!response.ok) {
      throw new Error("Failed to fetch users.json");
    }
    const users = await response.json();

    const authenticatedUser = users.find((user) => user.userid === userid);

    if (authenticatedUser && authenticatedUser.password === password) {
      localStorage.setItem("userid", userid);
      localStorage.setItem("userRole", authenticatedUser.status);
      generateLogFileNameForCurrentSession(userid);

      // Create the log file upon successful login
      await createLogFile();
      
      var currentDate = new Date();
      var formattedTime = currentDate.toLocaleString();


      const loginMessage = `${formattedTime} User '${userid}' logged in successfully.`;
      localStorage.setItem("loginMessage", loginMessage);
      console.log("Test");
      alert("Login Successfully");

      window.location.href = "initialize.html";
    } else if (!authenticatedUser) {
      openModal("User is not registered. Kindly contact the administrator.");
    } else {
      displayErrorMessage("Incorrect credentials. Please try again.");
    }
  } catch (error) {
    console.error("Error during authentication:", error);
    alert("An error occurred during login. Please try again.");
  }
}

const generateLogFileNameForCurrentSession = (userId) => {
  const currentDate = new Date();
  const formattedDate = currentDate.toISOString().split("T")[0];
  const formattedTime = currentDate  
    .toTimeString()
    .split(" ")[0]
    .replace(/:/g, "-");

  fileName = `${formattedDate}-${formattedTime}-${userId}`;
  localStorage.setItem("fileName", fileName);
};

const formatTimestamp = () => {
  const now = new Date();
  const date = now.toISOString().split("T")[0];
  const time = now.toTimeString().split(" ")[0];
  return `${date} ${time}`;
};

const createLogFile = async () => {
  fileName = localStorage.getItem("fileName") + ".elog";
  userid = localStorage.getItem("userid");
  // timestamp = formatTimestamp();
  // loginMessage = `${timestamp}: user ${userid} logged in`;
  var currentTime = new Date();
  var formattedTime = currentTime.toLocaleString();
  loginMessage = formattedTime + `: User ${userid} logged in`;
    

  try {
    // const response = await fetch("http://localhost:3000/create-log", {
    const response = await fetch("http://localhost:3001/addLog", {  
    method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ file: fileName, userid, log: loginMessage }),
    });
    const data = await response.json();
    console.log("Log file created:", data);
  } catch (error) {
    console.error("Error creating log file:", error);
  }
};

const displayErrorMessage = (message) => {
  const passwordInput = document.getElementById("password");
  const existingErrorMessage = document.querySelector("#password-error-msg");
  if (existingErrorMessage) {
    existingErrorMessage.parentNode.removeChild(existingErrorMessage);
  }

  const errorMessage = document.createElement("div");
  errorMessage.id = "password-error-msg";
  errorMessage.style.color = "red";
  errorMessage.innerText = message;
  errorMessage.style.display = "block";
  errorMessage.style.marginTop = "5px";
  errorMessage.style.fontSize = "16px";
  errorMessage.style.fontWeight = "bold";
  passwordInput.parentNode.insertAdjacentElement("afterend", errorMessage);
};

// Functions for custom modal
function openModal(message) {
  const modal = document.getElementById("errorModal");
  const modalText = document.getElementById("modalText");

  if (modal && modalText) {
    modalText.innerText = message;
    modal.style.display = "block";
  } else {
    console.error("Modal elements not found.");
  }
}

function closeModal() {
  const modal = document.getElementById("errorModal");
  if (modal) {
    modal.style.display = "none";
  } else {
    console.error("Modal element not found.");
  }
  // Prevent form submission
  return false;
}

function openDialog() {
  // Display the confirmation dialog
  const dialogOverlay = document.getElementById("dialogOverlay");
  if (dialogOverlay) {
    dialogOverlay.style.display = "block";
  } else {
    console.error("Dialog overlay element not found.");
  }
}

function closeDialog() {
  // Hide the confirmation dialog
  const dialogOverlay = document.getElementById("dialogOverlay");
  if (dialogOverlay) {
    dialogOverlay.style.display = "none";
  } else {
    console.error("Dialog overlay element not found.");
  }
}

function handleNo(event) {
  // Handle "No" button click
  closeDialog();
  event.stopPropagation();
  event.preventDefault(); // Prevent the default button behavior
}

function handleYes(event) {
  // Handle "Yes" button click
  alert("Cancelled!");
  closeDialog();
  event.preventDefault(); // Prevent the default button behavior
}

function logout() {
  localStorage.removeItem("userid");
  localStorage.removeItem("userRole");
  window.location.href = "initialize.html";
}
window.history.pushState(null, null, window.location.href);
window.onpopstate = function () {
    window.history.go(1);}