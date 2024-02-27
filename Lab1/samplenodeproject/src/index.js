//index.js
//This file is the entry point for the npm project
//It requires the express module and creates a simple web server

const express = require("express"); //import the express module
const app = express(); //create an express application

//define a route handler for the root path
app.get("/", (request, response) => {
  response.send("Hello, this is a sample npm project!"); //send a response to the client
});

//start the server on port 3000
app.listen(3000, () => {
  console.log("Server is running on port 3000...");
});
