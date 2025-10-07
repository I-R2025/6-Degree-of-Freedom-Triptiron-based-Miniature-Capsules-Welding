var selectedDate = null // Track the selected date

function logButtonClick(buttonName) {


  // Get log element
  var log = document.getElementById("log");

  // Get current date and time
  var currentDate = new Date();
  var formattedTime = currentDate.toLocaleString(); // Use toLocaleString for both date and time

  // Create log message
  var logMessage = "[" + formattedTime + "] Button clicked: " + buttonName;

  // Append log message to log element at the top
  log.insertAdjacentHTML('afterbegin', logMessage + "<br>");
}

// Function to show the date picker
function showDatePicker() {
  document.getElementById("datePicker").style.display = "block"
}

// Function to handle date selection and open file browser
function selectDate() {
  selectedDate = document.getElementById("datePicker").value
  document.getElementById("fileBrowser").style.display = "block"
  resetFileInputAndOpenBrowser(selectedDate) // Use the new function to reset and open the file browser
}

// Function to reset file input
function resetFileInput() {
  var fileInput = document.getElementById("logFileInput")
  fileInput.value = "" // Clear the file input
}

// Function to reset file input and open browser
function resetFileInputAndOpenBrowser(selectedDate) {
  // Create a new file input element
  var newFileInput = document.createElement("input")
  newFileInput.type = "file"
  newFileInput.id = "logFileInput" // Ensure the new input has the same ID as the old one
  newFileInput.style.display = "none"
  newFileInput.onchange = handleFileSelect(selectedDate) // Attach the same onchange handler as the old input

  // Replace the old file input with the new one
  var oldFileInput = document.getElementById("logFileInput")
  oldFileInput.parentNode.replaceChild(newFileInput, oldFileInput)

  // Trigger the click event on the new file input to open the file browser
  newFileInput.click()
}

var openedTab = null // Track the opened tab

function extractDateFromFileName(fileName) {
  var datePattern = /\d{4}-\d{2}-\d{2}/; // Pattern to match the date part of the filename
  var match = fileName.match(datePattern);
  return match ? match[0] : null;
}

function handleFileSelect(selectedDate) {


  var selectedFile = document.getElementById("logFileInput").files[0]
  var reader = new FileReader()

  if (selectedFile) {
    var fileName = selectedFile.name;

    // Extract the date part from the filename
    var fileDate = extractDateFromFileName(fileName);

    console.log({
      fileDate, selectedDate
    })
    // if (fileDate === selectedDate) {

    //   reader.onload = function (e) {
    //     // If a tab is already opened, close it
    //     if (openedTab && !openedTab.closed) {
    //       openedTab.close()
    //     }

    //     // Open a new tab and keep its reference
    //     openedTab = window.open()
    //     openedTab.document.write("<pre>" + e.target.result + "</pre>")

    //     // Reset the selectedDate variable after file selection
    //     selectedDate = null

    //     // Clear the file input
    //     resetFileInput()

    //     // Hide the file browser
    //     document.getElementById("fileBrowser").style.display = "none"

    //     // Reset the selected date in the calendar
    //     document.getElementById("datePicker").value = "" // This line ensures the date input is cleared
    //   }

    //   reader.readAsText(selectedFile)

    // }
  }
}
