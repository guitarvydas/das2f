
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (param => {
  var Relation = param [0];
var Subject = param [1];
var Object = param [2];
  console.log(`das_fact: ${Relation} ${Subject} ${Object}`);
});

