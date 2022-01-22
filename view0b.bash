

cat >view0b.pl <<'~~~'

    :- use_module(library(http/json)).

    qd:-
        consult(fb),
    bagof(
	  [Relation,Subject,Object],
	  (
	      das_fact(Relation,Subject,Object),
	      Relation \= bbL,
	      Relation \= bbT,
	      Relation \= bbR,
	      Relation \= bbB
	  ),
	      Bag),
	  json_write(user_output,Bag,[width(128)])

    .

~~~
cat >view0b.js <<'~~~'

const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (param => {
  var Relation = param [0];
var Subject = param [1];
var Object = param [2];
  console.log(`das_fact: ${Relation} ${Subject} ${Object}`);
});

~~~

swipl -g "consult(view0b)." -g 'qd.' -g 'halt.' | node view0b.js
rm -f ${temp}.pl
rm -f ${temp}.js

