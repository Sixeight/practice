var promiseagent = require("./promiseagent.js")
require("whatwg-fetch");

promiseagent
  .get("./dist/test.json")
  .promise()
  .then(function(res) {
    console.log(res.body);
  })
  .catch(function(err) {
    console.log(err.message);
  });

fetch("./dist/test.json")
  .then(function(res) {
    if (res.status == 200) {
      return Promise.resolve(res);
    } else {
      return Promise.reject(new Error(res.statusText));
    }
  })
  .then(function(res) {
    return res.json();
  })
  .then(function(json) {
    console.log(json);
  }).catch(function(err) {
    console.log(err.message);
  });

var formData = new FormData();
formData.append("a", 1);
formData.append("b", "string");

fetch("/", {
    method: "POST",
    body: formData
  })
  .then(function(res) {
    return res.json();
  })
  .then(function(json) {
    console.log(json);
  })
  .catch(function(err) {
    console.log(err.message);
  });


fetch("/", {
    method: "POST",
    body: "a=5"
  })
  .then(function(res) {
    return res.json();
  })
  .then(function(json) {
    console.log(json);
  })
  .catch(function(err) {
    console.log(err.message);
  });
