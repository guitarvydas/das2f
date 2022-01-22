

temp=temp${RANDOM}
# layer 3


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult(fb).
?- consult("/Users/tarvydas/app/das2f/shapes").
?- consult("/Users/tarvydas/app/das2f/onSameDiagram").
?- consult("/Users/tarvydas/app/das2f/inside").
?- consult("/Users/tarvydas/app/das2f/names").
?- consult("/Users/tarvydas/app/das2f/ports").
?- consult("/Users/tarvydas/app/das2f/contains").
query_helper(Parent,Child):-
contains(Parent,Child),
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
  
if (true) { console.log (`das_fact(contains,${Parent},${Child}).`);};
});
  
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

