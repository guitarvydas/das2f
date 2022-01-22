

cat >view3.pl <<'~~~'

    :- use_module(library(http/json)).

    qd:-
        consult(fb),
    consult(shapes),
    consult(values),
    consult(names),
    consult(ports),
    bagof([Parent, Child],
	  (
          das_fact(direct_contains,ParentID,ChildID),
          nameof(ParentID,Parent),
		  nameof(ChildID,Child)
      ),	
	  Bag),
	  json_write(user_output,Bag)

    .

~~~
cat >view3.js <<'~~~'

const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (param => {
  var Parent = param [0];
var Child = param [1];
  console.log(`${Parent} direct-contains ${Child}`);
});

~~~

swipl -g "consult(view3)." -g 'qd.' -g 'halt.' | node view3.js
rm -f ${temp}.pl
rm -f ${temp}.js

