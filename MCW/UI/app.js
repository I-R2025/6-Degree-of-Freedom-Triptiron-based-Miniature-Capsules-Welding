const express = require("express");
const path = require("path");
const fs = require("fs");
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();
const ping = require('ping');

const port = 3001;
app.use(express.static(path.join(__dirname, "public")));


app.use(cors());
app.use(bodyParser.json());
app.use(express.json());

// Handle POST request to update users
app.post("/update-users", (req, res) => {
  const userDetails = req.body;

  fs.readFile(
    path.join(__dirname, "public", "users.json"),
    "utf8",
    (err, data) => {
      if (err) {
        console.error(err);
        res.status(500).send("Internal Server Error");
        return;
      }

      let users = JSON.parse(data);

      if (userDetails.action === "addNewUser") {
        // Add the new user to the existing users array
        users.push({
          userid: userDetails.userid,
          password: userDetails.password,
          status: userDetails.status,
        });
        ////////////////////////////////////////////////////////

        // Convert the updated users array back to JSON string
        let updatedData = JSON.stringify(users, null, 2); // 2 is for indentation for better readability

        // Write the updated JSON data back to the file
        fs.writeFile(
          path.join(__dirname, "public", "users.json"),
          updatedData,
          "utf8",
          (err) => {
            if (err) {
              console.error(err);
              res.status(500).send("Internal Server Error");
              return;
            }
            console.log("Users file has been updated.");
            res.sendStatus(200); // Send success response
          }
        );
      }

      if (userDetails.action === "updatePassword") {
        const userIndex = users.findIndex(
          (user) => user.userid === userDetails.userid
        );
        users[userIndex].password = userDetails.newPassword;

        // Convert the updated users array back to JSON string
        let updatedData = JSON.stringify(users, null, 2); // 2 is for indentation for better readability

        // Write the updated JSON data back to the file
        fs.writeFile(
          path.join(__dirname, "public", "users.json"),
          updatedData,
          "utf8",
          (err) => {
            if (err) {
              console.error(err);
              res.status(500).send("Internal Server Error");
              return;
            }
            console.log("Password updated successfully.");
            res.sendStatus(200); // Send success response
          }
        );
      }
    }
  );
});
/////File Handling

app.post("/addLog", (req, res) => {
  const { log, file } = req.body;
  const filePath = path.join(__dirname, "logs", file);
  console.log("writing to log file")
// Check if the log file exists
fs.open(filePath, "r", (err, fd) => {
  if (err) {
    if (err.code === "ENOENT") {
      // File does not exist, create it
      fs.writeFile(filePath, log, (err) => {
        if (err) {
          console.error("Error creating log file:", err)
          return res.status(500).send("Internal Server Error")
        }
        console.log("Log file has been created.")
        return res.status(201).send("Log created successfully.")
      })
    } else {
      console.error("Error opening log file:", err)
      return res.status(500).send("Internal Server Error")
    }
  } else {
    // File exists, close the file descriptor
    fs.close(fd, (err) => {
      if (err) {
        console.error("Error closing file descriptor:", err)
        return res.status(500).send("Internal Server Error")
      }

      // Read the existing file content
      fs.readFile(filePath, "utf8", (err, data) => {
        if (err) {
          console.error("Error reading log file:", err)
          return res.status(500).send("Internal Server Error")
        }

        // Combine existing log data with the new log
        let updatedData = data + log

        // Write the updated data back to the file
        fs.writeFile(filePath, updatedData, "utf8", (err) => {
          if (err) {
            console.error("Error writing to log file:", err)
            return res.status(500).send("Internal Server Error")
          }
          console.log("Log file has been updated.")
          return res.status(200).send("Log updated successfully.")
        })
      })
    })
  }
})
})
//   // Ensure the logs directory exists
//   fs.mkdirSync(path.dirname(filePath), { recursive: true });

//   fs.readFile(filePath, "utf8", (err, data) => {
//     if (err && err.code !== "ENOENT") {
//       console.error("Error reading log file:", err);
//       return res.status(500).send("Internal Server Error");
//     }

//     const existingData = data ? data.trim() : ""; // Trim any extra new lines
//     const existingEntries = existingData.split("\n").filter(Boolean);
//     const logEntries = log.split("\n").filter(Boolean);

//     // Filter out duplicate log entries
//     const newEntries = logEntries.filter(
//       (entry) => !existingEntries.includes(entry)
//     );

//     // Append new log entries
//     const updatedData = existingEntries.concat(newEntries).join("\n");

//     fs.writeFile(filePath, updatedData + "\n", "utf8", (err) => {
//       if (err) {
//         console.error("Error writing to log file:", err);
//         return res.status(500).send("Internal Server Error");
//       }
//       console.log("Log file has been updated.");
//       return res.status(200).send("Log updated successfully.");
//     });
//   });
// });

app.post("/create-log", async (req, res) => {
  try {
    const { userid, file, log } = req.body;

    if (!userid || !file || !log) {
      return res.status(400).json({
        error: "Missing userid, file name, or log message in request body",
      });
    }

    const filename = path.join(__dirname, "logs", file);

    // Create directory if it doesn't exist
    fs.mkdirSync(path.dirname(filename), { recursive: true });

    // Write the initial log message with the timestamp
    fs.writeFile(filename, log + "\n", (err) => {
      if (err) {
        console.error("Failed to create log file", err);
        return res.status(500).json({ error: "Failed to create log file" });
      }

      res
        .status(201)
        .json({ message: "Log file created successfully!", filename });
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to create log file" });
  }
});

app.post("/remove-user", async (req, res) => {
  const { userid } = req.body;

  try {
    const usersFilePath = path.join(__dirname, "public", "users.json");
    const users = JSON.parse(fs.readFileSync(usersFilePath, "utf8"));

    const userIndex = users.findIndex(
      (user) => user.userid === userid && user.status !== "admin"
    );

    if (userIndex !== -1) {
      users.splice(userIndex, 1);
      fs.writeFileSync(usersFilePath, JSON.stringify(users, null, 2));
      res.status(200).json({ message: "User removed successfully" });
    } else {
      res
        .status(404)
        .json({ message: `No such user found with the name: ${userid}` });
    }
  } catch (error) {
    console.error("Error reading or writing to users.json:", error);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

/////////////////////////////////////////////////////////////

async function myFunction(data) {
  // console.log('Function called with data:', data);

  try {
      // Convert ping.sys.probe to return a Promise
      const isAlive = await new Promise((resolve, reject) => {
          ping.sys.probe(data.CameraIP, (isAlive) => {
              if (isAlive !== undefined) {
                  resolve(isAlive);
              } else {
                  reject(new Error('Failed to probe the host'));
              }
          });
      });
      // console.log(isAlive ? 'Host is reachable.' : 'Host is not reachable.');
        return isAlive;

  } catch (error) {
      console.error('Error occurred:', error);
      throw error; // Optional: rethrow the error if you want to handle it further up the call stack
  }
}

app.post('/pingCamera',async (req, res) => {
  const result = await myFunction(req.body);
  res.json(result); // Send the boolean data as JSON

});


app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});


app.get("/startRecording", (req, res) => {
  const { cameraFeedUrl, output_file } = req.body;
  const filePath = path.join(__dirname, "recordings", output_file );
  const command='cvlc ${cameraFeedUrl} --sout="#file{dst=${filePath}}" --no-sout-rtp-sap --no-sout-standard-sap -ssout-all --loop --quiet &'
  console.log('Starting Recording');
  exec(command,(error,stdout,stderr)=>{
    
    if(error){
      console.error('Error starting VLC: ${error.message}');
      return;
    }
    
    if(stderr){
      console.error('VLS stderr: ${stderr.}');
      return;
    }

    console.log('VLC started, output: ${stdout}');
    });
});