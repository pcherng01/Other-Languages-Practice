% Problem #2, "Imaginary Friends"
% Each child goes on adventure with imaginary friend.

animal(grizzly_bear).
animal(moose).
animal(seal).
anima(zebra).

child(joanne).
child(lou).
child(ralph).
child(winnie).

adventure(circus).
adventure(rock_band).
adventure(spaceship).
adventure(train).

solve :-
    animal(JoanneAnimal), animal(LouAnimal), animal(RalphAnimal), animal(WinnieAnimal),
    all_different([JoanneAnimal, LouAnimal, RalphAnimal, WinnieAnimal]),
    
    adventure(JoanneAdventure), adventure(LouAdventure),
    adventure(RalphAdventure), adventure(WinnieAdventure),
    all_different([JoanneAdventure, LouAdventure, RalphAdventure, WinnieAdventure]),

    Triples = [ [joanne, JoanneAnimal, JoanneAdventure],
                [lou, LouAnimal, LouAdventure],
                [ralph, RalphAnimal, RalphAdventure],
                [winnie, WinnieAnimal, WinnieAdventure] ],
   
    % 1. The seal (who isn't the creation of either Joanne or Lou) neither rode to the moon in a 
    %     spaceship nor took a trip around the world on a magic train.
    \+ member([joanne, seal,_], Triples), 
    \+ member([lou, seal,_], Triples),
    
    \+ member([_, seal, spaceship], Triples),
    \+ member([_,seal, train], Triples),
    
    % 2. Joanne's imaginary friend (who isn't the grizzly bear) went to the circus.
    	member([joanne,_, circus], Triples),
    \+ member([joanne, grizzly_bear, _], Triples),
    	member([_, grizzly_bear, circus], Triples),
         
    % 3. Winnie's imaginary friend is a zebra
    member([winnie,zebra,_], Triples),
    
    % 4. The grizzly bear didn't board the spaceship to the moon
    \+ member([_,grizzly_bear, spaceship], Triples),
    
    
    tell(joanne, JoanneAnimal, JoanneAdventure),
    tell(lou, LouAnimal, LouAdventure),
    tell(ralph, RalphAnimal, RalphAdventure),
    tell(winnie, WinnieAnimal, WinnieAdventure).
    
% Succeeds if all elements of the argument list are bound and different.
% Fails if any elements are unbound or equal to some other element.
all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

tell(X, Y, Z) :-
    write('Children '), write(X), write(' with his/her '), write(Y),
    write(' went on '), write(Z), write('.'), nl.