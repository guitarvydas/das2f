
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (param => {
  var Name = param [0];
var Direction = param [1];
  console.log(`${Name} ${Direction}`);
});

