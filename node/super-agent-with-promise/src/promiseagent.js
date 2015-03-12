var superagent = module.exports = require("superagent");

var Promise = require("Bluebird");
var Request = superagent.Request;

Request.prototype.promise = function() {
  var request = this;
  var promise = new Promise(function(resolve, reject) {
    request.end(function(err, res) {
      if (res !== undefined && res.status >= 400) {
        reject(new Error("error: " + res.status));
      } else if (err) {
        reject(err);
      } else {
        resolve(res);
      }
    });
  });
  promise = promise
    .cancellable()
    .catch(Promise.CancellationError, function(e) {
      request.abort();
      throw e;
    });
  return promise;
}
