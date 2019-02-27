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

child(craig, john).
child(craig, sarah).
child(rachel, john).
child(rachel, sarah).
child(sam, craig).
child(sam, rose).
child(sakura, rose).
child(sakura, craig).
child(johnny_bravo, rose).

all_children_of(Parent, Children) :-
    findall(Parent/Child, child(Child, Parent), 
            Children).


ab(X) :-
    X > 10.

ab(X) :- 
    X < 2.

parent(X, Y) :- 
    child(Y, X).

not_parent(X,Y) :-
    not(parent(X, Y)).

not_equal(X, Y) :-
    not(X = Y).

father(X, Y) :-
    male(X),
    parent(X, Y).

grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

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


edge(a, b, 5).
edge(a, e, 8).
edge(b, c, 7 ).
edge(b, f, 2).
edge(d, g, 3).
edge(e, d, 3).
edge(e, f, 6).
edge(f, c, 1).
edge(g, h, 10).
edge(h, f, 4).

all_neighbors(Node, Neighbors) :-
    findall([Neighbor, Cost], edge(Node, Neighbor, Cost),
            UnNeighbors),
    sort(0, @<, UnNeighbors, Neighbors).

set_union([], L1, L1).
set_union([Head | T1], L1, 
          [Head | T2]) :-
    set_union(T1, L1, T2),
    not(member(Head, T2)),!.
set_union([_ | T1], L1, T2):-
    set_union(T1, L1, T2),!.


is_path(X, Y) :-
    edge(X, Y), !.

is_path(X, Y) :-
    edge(X, Z),
    is_path(Z, Y).

foobar(X+Y) :-
    male(X),
    female(Y).

calc(X, Y, Z) :-
    Z is X+Y.
    

    

