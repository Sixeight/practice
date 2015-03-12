var promiseagent = require("./promiseagent.js")

promiseagent
  .get("./dist/test.json")
  .promise()
  .then(function(res) {
    console.log(res.body);
  })
  .catch(function(err) {
    console.log(err.message);
  });
