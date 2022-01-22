

temp=temp${RANDOM}
# contains port


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult(fb).
?- consult("/Users/tarvydas/app/das2f/shapes").
?- consult("/Users/tarvydas/app/das2f/onSameDiagram").
?- consult("/Users/tarvydas/app/das2f/inside").
?- consult("/Users/tarvydas/app/das2f/names").
?- consult("/Users/tarvydas/app/das2f/ports").
query_helper(Parent,Child):-
das_fact(contains,Parent,X),
das_fact(contains,X,Child),
true.
query:-
(bagof([Parent,Child],query_helper(Parent,Child),Bag),
json_write(user_output,Bag,[width(128)])
)
;
json_write(user_output,[],[width(123)]).
~~~
cat >${temp}.js <<'~~~'
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var Parent = p [0];
var Child = p [1];
  
if (true) { console.log (`das_fact(indirect_contains,${Parent},${Child}).`);};
});
  
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

