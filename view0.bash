

cat >view0.pl <<'~~~'

    :- use_module(library(http/json)).

    qd:-
        consult(fb),
    bagof(
	  [Relation,Subject,Object],
	  das_fact(Relation,Subject,Object)
	  ,Bag),
	  json_write(user_output,Bag,[width(128)])

    .

~~~
cat >view0.js <<'~~~'

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

swipl -g "consult(view0)." -g 'qd.' -g 'halt.' | node view0.js
rm -f ${temp}.pl
rm -f ${temp}.js

