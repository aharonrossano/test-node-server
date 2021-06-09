const express = require("express");
const app = express();

app.listen(3000, function () {
  console.log("listening on 3000");
});

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/hello1/", (req, res) => {
  res.send("Hello World 1!");
});

app.get("/hello2/", (req, res) => {
  res.send("Hello World 2!");
});

app.get("/url/", (req, res) => {
  let fullUrl = req.protocol + '://' + req.get('host') + req.originalUrl;

  res.send("url: " + fullUrl);
});
