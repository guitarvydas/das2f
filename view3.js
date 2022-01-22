
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (param => {
  var Parent = param [0];
var Child = param [1];
  console.log(`${Parent} direct-contains ${Child}`);
});

