:- dynamic f1/1.

f1(a).
f1(b).

print_list([H | T]) :-
    atomic_list_concat([H | T], ',', Atom), 
    atom_string(Atom, S1),
    string_concat('[', S1, S2),
    string_concat(S2, ']', Resp),
    writeln(Resp).

r1 :- 
    f1(a), f1(b), 
    writeln("Asserted Z"),
    assertz(f1(z)).

main :- 
    r1,
    findall(X, f1(X), Xs),
    print_list(Xs).
   	
