const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
    var ID = p [0];
    var Direction = p [1];
    
    if (${Direction} === "?") {
	console.log (`all ports must have a direction ; port ${ID} has no direction`);
    }
    else if (${Direction} === "?2") {
	console.log (`all ports must have a direction ; port ${ID} has no direction`);
    } else if (true) {
	console.log (`das_fact(direction,${ID},${Direction}).`);
    }
    else if (true) {
	console.log (`das_fact2(direction,${ID},${Direction}).`);
    });
		   });
