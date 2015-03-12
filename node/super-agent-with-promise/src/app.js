var superagent = require("superagent");
var Promise = require("blueprint");

superagent
  .get("./dist/test.json")
  .end(function(err, res) {
    console.log(res.ok);
  });
