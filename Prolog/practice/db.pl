loves(romeo, juliet).

loves(juliet, romeo) :- loves(romeo, juliet).

happy(albert).
happy(alice).
happy(bob).
happy(bill).
with_albert(alice).

runs(albert) :- happy(albert).

dances(alice) :-
	happy(alice),
	with_albert(alice).
	
does_alice_dance :- dances(alice),
	write('When Alice is ahppy and with Albert she dances').

swims(bill) :-
	happy(bill).
	
swims(bill) :-
	near_water(bill).	
	
female(alice).
female(betsy).
female(diana).

parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).

parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).

parent(bob, carl).
parent(bob, charlie).

get_grandchild :-
	parent(X, carl),
	parent(X, charlie),
	format('~w ~s grandparent ~n', [X, "is the"]).
	
brother(bob, bill).


grand_parent(X, Y) :-
	parent(Z, X),
	parent(Y, Z).
	
blushes(X) :- human(X).
human(derek).

stabs(tybalt, mercutio, sword).
hates(romeo, X) :- stabs(X, mercutio, sword).

what_grade(5) :-
	write('Go to kindergarten').

what_grade(6) :-
	write('Go to 1st Grade').
	
what_grade(Other) :-
	Grade is Other - 5,
	format('Go to grade ~w', [Grade]).
	
owns(albert, pet(cat, olive)).

customer(tom, smith, 20.55).
customer(sally, smith, 120.55).

get_cust_bal(FName, LName) :-
	customer(FName, LName, Bal),
	write(FName), tab(1),
	format('~w owes us $~2f ~n', [LName, Bal]).