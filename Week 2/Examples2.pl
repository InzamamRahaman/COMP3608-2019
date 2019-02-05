a(1).
a(2).
a(3).
a(4).

b(1).
b(2).
b(3).
b(4).

c(X, Y) :- 
    a(X),
    !,
    b(Y).

length_of_list([], 0).
length_of_list([_ | Tail], Ans) :- 
    length_of_list(Tail, Temp),
    Ans is Temp + 1.


sum_of_list([], 0).
sum_of_list([Head | Tail], Ans) :-
    sum_of_list(Tail, TempAns),
    Ans is Head + TempAns.

product_of_list([], 1).
product_of_list([Head | Tail], Ans) :-
    product_of_list(Tail, TempAns),
    Ans is Head * TempAns.

prepend(Item, [], [Item]).
prepend(Item, L, [Item | L]).

append_to_list([], Element, [Element]).
append_to_list([Head | Tail], Element, [Head | NewTail]) :- 
    append_to_list(Tail, Element, NewTail).

concat_lists([], List1, List1).
concat_lists([Head | T1], List1, [Head | T2]) :- 
    concat_lists(T1, List1, T2).


negative(X) :-
    X < 0.

filter_negatives([], []).

filter_negatives([Head | Tail], [Head | NewTail]) :-
    negative(Head),!,
    filter_negatives(Tail, NewTail).

filter_negatives([_ | Tail], NewTail) :-
    filter_negatives(Tail, NewTail).


greater_than_10(X) :-
    X > 10.

filter_greater_than_10([], []).

filter_greater_than_10([Head | Tail], [Head | NewTail]) :-
    greater_than_10(Head),!,
    filter_greater_than_10(Tail, NewTail).

filter_greater_than_10([_ | Tail], NewTail) :-
    filter_greater_than_10(Tail, NewTail).

my_add(X, Y, Ans) :- Ans is X + Y.
my_product(X, Y, Ans) :- Ans is X * Y.
my_reduce([], _, Default, Default).
my_reduce([Head | Tail], P, Default, Ans) :-
    my_reduce(Tail, P, Default, Temp),
    call(P, Head, Temp, Ans).

my_filter([], _, []).
my_filter([Head | Tail], P, 
          [Head | NewTail]) :-
    call(P,Head),!,
    my_filter(Tail, P, NewTail).
my_filter([_ | Tail],P, NewTail) :-
    my_filter(Tail,P, NewTail).


    





