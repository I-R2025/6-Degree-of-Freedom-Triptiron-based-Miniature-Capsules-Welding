// Function to show overlay
function showOverlay() {
    document.getElementById('overlay').style.display = 'block';
  }
  
  // Function to hide overlay
  function hideOverlay() {
    document.getElementById('overlay').style.display = 'none';
  }
  
  // Event listener for opening User Management form
  document.getElementById('userManagementBtn').addEventListener('click', function() {
    // Display the User Management modal or form
    document.getElementById('userManagementModal').style.display = 'block';
    
    // Show overlay
    showOverlay();
  });
  
  // Event listener for closing User Management form
  document.getElementById('closeModalButton').addEventListener('click', function() {
    // Hide the User Management modal or form
    document.getElementById('userManagementModal').style.display = 'none';
    
    // Hide overlay
    hideOverlay();
  });
  