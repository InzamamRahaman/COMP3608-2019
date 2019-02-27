
% facts that describe the genders of individuals
male(john).
male(craig).
male(johnny_bravo).
male(jack).
male(sammy).

female(sarah).
female(rachel).
female(rose).
female(sakura).
female(sam).

% facts that describe the family tree in terms of child relationships
child(craig, john).
child(craig, sarah).
child(rachel, john).
child(rachel, sarah).
child(sam, craig).
child(sam, rose).
child(sakura, rose).
child(sakura, craig).
child(johnny_bravo, rose).


% Simple rule for parents
parent(X, Y) :- 
    child(Y, X).

% Examples of the usage of not
not_parent(X,Y) :-
    not(parent(X, Y)).

not_equal(X, Y) :-
    not(X = Y).

% Writing rules with the same head is functionally 
% equivalent to disjunction
ab(X) :-
    X > 10.

ab(X) :- 
    X < 2.

% Rule describing father relationship
father(X, Y) :-
    male(X),
    parent(X, Y).

grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% Cut operator prevents repeated answers
siblings(X, Y) :-
    child(X, P1),
    child(Y, P1),
    child(X, P2),
    child(Y, P2),
    not(X = Y),
    not(P1 = P2), 
    !.


halfsiblings(X, Y) :-
    child(X, P1),
    child(Y, P1),
    child(X, P2),
    not(X = Y),
    not(P1 = P2),
    not_parent(P2, Y).


aunt(X, Y) :- 
    female(X),
    parent(Z, Y),
    siblings(X, Z).


% facts to describe the graph
edge(a, b).
edge(a, e).
edge(b, c).
edge(b, f).
edge(d, g).
edge(e, d).
edge(e, f).
edge(f, c).
edge(g, h).
edge(h, f).

% rules for determining if you can reach one node
% from another
is_path(X, Y) :-
    edge(X, Y), !.

is_path(X, Y) :-
    edge(X, Z),
    is_path(Z, Y).

% Example showing how we can use operators
% for custom strucutres
foobar(X+Y) :-
    male(X),
    female(Y).

% Example for calculation
calc(X, Y, Z) :-
    Z is X+Y.
    
    

