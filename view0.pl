
    :- use_module(library(http/json)).

    qd:-
        consult(fb),
    bagof(
	  [Relation,Subject,Object],
	  das_fact(Relation,Subject,Object)
	  ,Bag),
	  json_write(user_output,Bag,[width(128)])

    .

