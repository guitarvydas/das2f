

temp=temp${RANDOM}
# layer kind


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult(fb).
?- consult("/Users/tarvydas/app/das2f/shapes").
?- consult("/Users/tarvydas/app/das2f/onSameDiagram").
?- consult("/Users/tarvydas/app/das2f/inside").
?- consult("/Users/tarvydas/app/das2f/names").
?- consult("/Users/tarvydas/app/das2f/ports").
?- consult("/Users/tarvydas/app/das2f/contains").
query_helper(ID,Color):-
diagram_fact(cell,ID,_),
(diagram_fact(fillColor, ID, "#d5e8d4")  -> Color = "green";diagram_fact(fillColor, ID, "#fff2cc")  -> Color = "yellow";diagram_fact(fillColor, ID, "#f8cecc")  -> Color = "red";diagram_fact(fillColor, ID, "#9673A6")  -> Color = "purple"; Color = "-"),
true.
query:-
(bagof([ID,Color],query_helper(ID,Color),Bag),
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
var Color = p [1];
  
if (true) { console.log (`das_fact(color,${ID},\"${Color}\").`);};
});
  
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

