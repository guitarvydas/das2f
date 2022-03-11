
temp=temp${RANDOM}
# contains edge


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult("fb.pl").
?- consult("/Users/tarvydas/projects/das2f/shapes.pl").
?- consult("/Users/tarvydas/projects/das2f/onSameDiagram.pl").
?- consult("/Users/tarvydas/projects/das2f/inside.pl").
?- consult("/Users/tarvydas/projects/das2f/names.pl").
?- consult("/Users/tarvydas/projects/das2f/ports.pl").
query_helper(Parent,Edge):-
das_fact(kind,Edge,edge),
das_fact(kind,Parent,rectangle),
diagram_fact(source,Edge,SourceLongID),
diagram_fact(synonym,Source,SourceLongID),
das_fact(direct_contains,Rect,Source),
das_fact(direct_contains,Parent,Rect),
true.
query:-
(bagof([Parent,Edge],query_helper(Parent,Edge),Bag),
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
var Edge = p [1];
  
if (true) { console.log (`das_fact(direct_contains,${Parent},${Edge}).`);};
});
  
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

