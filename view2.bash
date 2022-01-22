

cat >view2.pl <<'~~~'

    :- use_module(library(http/json)).

    qd:-
        % from common.pl but using fb.pl instead of fb.pl
    consult(fb),
    consult(shapes),
    consult(values),
    consult(names),
    consult(ports),
    bagof([Name, Direction],
	  (
		  diagram_fact(vertex,V,1),
		  isellipse(V),
          nameof(V,Name),
		  das_fact(direction,V,Direction)
      ),	
	  Bag),
	  json_write(user_output,Bag)

    .

~~~
cat >view2.js <<'~~~'

const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (param => {
  var Name = param [0];
var Direction = param [1];
  console.log(`${Name} ${Direction}`);
});

~~~

swipl -g "consult(view2)." -g 'qd.' -g 'halt.' | node view2.js
rm -f ${temp}.pl
rm -f ${temp}.js

