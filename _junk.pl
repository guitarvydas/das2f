designrule:-
    (
	(
	    das_fact(kind,Edge,edge),
	    bagof([Passed,Edge],cond0(Passed,Edge),Bag),
	    true
	) 
    -> true
    ; (Edge = true, Passed = true, Bag = [[Passed, Edge]])
    ),
    json_write(user_output,Bag,[width(128)]).
