

temp=temp${RANDOM}
# layer names


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult(fb).
?- consult("/Users/tarvydas/app/das2f/shapes").
?- consult("/Users/tarvydas/app/das2f/onSameDiagram").
?- consult("/Users/tarvydas/app/das2f/inside").
?- consult("/Users/tarvydas/app/das2f/names").
?- consult("/Users/tarvydas/app/das2f/ports").
?- consult("/Users/tarvydas/app/das2f/contains").
query_helper(ID,Name):-
diagram_fact(vertex,ID,_),
diagram_fact(value,ID,Name),
true.
query:-
(bagof([ID,Name],query_helper(ID,Name),Bag),
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
  var ID = p [0];
var Name = p [1];
  
if (true) { console.log (`das_fact(name, ${ID}, \"${Name}\").`);};
});
  
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

