// let userRole = localStorage.getItem('userRole') || 'defaultRole';
document.addEventListener("DOMContentLoaded", function () {
  console.log("DOMContentLoaded event triggered.")

  document
    .getElementById("userManagementBtn")
    .addEventListener("click", function (event) {
      console.log("User management button clicked.") // Debugging line

      event.preventDefault() // Prevent the default form submission behavior

      const userRole = localStorage.getItem("userRole")
      console.log("User role:", userRole) // Debugging line

      const modal = document.getElementById("userManagementModal")
      modal.style.display = "block"

      if (userRole === "admin") {
        console.log("User is admin.") // Debugging line

        document.getElementById("changePasswordForm").style.display = "none"
        document.getElementById("addNewUserForm").style.display = "block"
      } else if (userRole === "user") {
        console.log("User is user.") // Debugging line

        document.getElementById("changePasswordForm").style.display = "block"
        document.getElementById("addNewUserForm").style.display = "none"
      }
    })

  document
    .getElementById("addUserButton")
    .addEventListener("click", function (event) {
      event.preventDefault()
      handleUserAction("addNewUser")
    })

  document
    .getElementById("removeUserButton")
    .addEventListener("click", function (event) {
      event.preventDefault()
      const userid = prompt("Enter userid to remove:")
      if (userid) {
        removeUser(userid)
      }
    })

  function handleUserAction(action) {
    const userid = document.getElementById("new-userid").value
    const password = document.getElementById("newPassword").value
    const userRole = document.querySelector(
      'input[name="userRole"]:checked'
    ).value

    if (action === "addNewUser") {
      const passwordRegex =
        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,12}$/
      if (!passwordRegex.test(password)) {
        alert(
          "Password must be 8-12 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character."
        )
        return
      }
    }

    const userActionData = {
      userid: userid,
      password: password,
      status: userRole,
      action: action
    }

    fetch("/update-users", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(userActionData)
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("Failed to update users data")
        }
        alert("Users data updated successfully")
      })
      .catch((error) => {
        console.error("Error:", error)
      })
  }

  const removeUser = async (userid) => {
    try {
      const response = await fetch("/remove-user", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ userid })
      })

      const result = await response.json()
      if (response.ok) {
        console.log(result.message)
        alert(result.message)
      } else {
        console.error(result.message)
        alert(result.message)
      }
    } catch (error) {
      console.error("Error removing user:", error)
      alert("Error removing user.")
    }
  }

  document
    .getElementById("changePassword")
    .addEventListener("submit", function (event) {
      event.preventDefault() // Prevent the default form submission

      event.preventDefault()
      const newPassword = document.getElementById("new-Password").value
      const confirmPassword =
        document.getElementById("confirmNewPassword").value

      if (newPassword !== confirmPassword) {
        alert("Passwords does not match")
        return
      }

      const passwordRegex =
        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,12}$/

      if (!passwordRegex.test(newPassword)) {
        console.log("Tested")
      }

      const loggedInuserid = localStorage.getItem("userid")

      const existingUserPassword = {
        userid: loggedInuserid,
        newPassword: newPassword,
        action: "updatePassword"
      }

      fetch("/update-users", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(existingUserPassword)
      })
        .then((response) => {
          if (!response.ok) {
            throw new Error("Failed to update users password")
          }
          alert(loggedInuserid, " password updated successfully")
        })
        .catch((error) => {
          console.error("Error:", error)
        })

      console.log("Change Password clicked")
    })

  // Close modal when clicking outside of it
  window.addEventListener("click", function (event) {
    if (event.target === document.getElementById("userManagementModal")) {
      document.getElementById("userManagementModal").style.display = "none"
    }
  })
})

document.addEventListener("DOMContentLoaded", function () {
  console.log("DOMContentLoaded event triggered.")

  document
    .getElementById("userManagementBtn")
    .addEventListener("click", function () {
      console.log("User management button clicked.") // Debugging line

      const userRole = localStorage.getItem("userRole")
      console.log("User role:", userRole) // Debugging line

      const modal = document.getElementById("userManagementModal")
      modal.style.display = "block"

      // Hide both forms initially
      document.getElementById("changePasswordForm").style.display = "none"
      document.getElementById("addNewUserForm").style.display = "none"

      if (userRole === "admin") {
        console.log("User is admin.") // Debugging line

        // Display only the addNewUserForm for admins
        document.getElementById("addNewUserForm").style.display = "block"
      } else if (userRole === "user") {
        console.log("User is user.") // Debugging line

        // Display only the changePasswordForm for regular users
        document.getElementById("changePasswordForm").style.display = "block"
      }
    })
})
// Add event listener directly to the close button
document
  .getElementById("closeModalButton")
  .addEventListener("click", function () {
    console.log("Close button clicked.") // Debugging line

    const modal = document.getElementById("userManagementModal")
    modal.style.display = "none"
  })
