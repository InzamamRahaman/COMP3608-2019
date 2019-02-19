repeat_aux(_, 0, []).
repeat_aux(X, N, [X | Tail]) :-
    M is N - 1,
    repeat_aux(X, M, Tail).

prepend(X, [], [X]) :- !.
prepend(X, L, [X | L]) :- !.


priority_insert([Data, Cost], [], [[Data, Cost]]).
priority_insert([Data, Cost], [[Data1, Cost1] | Tail],
                Ans) :-
    Cost1 > Cost,
    prepend([Data1, Cost1], Tail, Temp),
    prepend([Data, Cost], Temp, Ans), !.
priority_insert([Data, Cost], [H | Tail],
                [H | NewTail]) :- 
    priority_insert([Data, Cost], Tail, NewTail).

priority_pop([[Data, Cost] | Tail], Data, Cost, Tail).

say_open([]) :-
    writeln('Open []'), !.

say_open([H | T]) :-
    atomic_list_concat([H | T], ',', Atom), 
    atom_string(Atom, S1),
    string_concat('Open [', S1, S2),
    string_concat(S2, ']', Resp),
    writeln(Resp).

say_closed([]) :- 
    writeln('Closed []'), !.

say_closed([H | T]) :-
    atomic_list_concat([H | T], ',', Atom), 
    atom_string(Atom, S1),
    string_concat('Closed [', S1, S2),
    string_concat(S2, ']', Resp),
    writeln(Resp).

set_diff([], _, []).
set_diff([H1 | T1], L1, [H1 | NT1]) :-
    not(member(H1, L1)),!,
    set_diff(T1, L1, NT1).

set_diff([H1 | T1], L1, NT1) :-
    member(H1, L1),!,
    set_diff(T1, L1, NT1).

concat_lists([], List1, List1).
concat_lists([Head | T1], List1, [Head | T2]) :- 
    concat_lists(T1, List1, T2).

insert_into_parent_list(_, Parent, C1, P1,
                        C2, P2) :-
    length(Children, N),
    repeat_aux(Parent, N, Parents),
    concat_lists(Parents, P1, P2),
    concat_lists(Children, C1, C2).

find_matching(Key, [Key | _], [Value | _], Value) :- !.
find_matching(_, [], [], _) :- fail.
find_matching(Key, [_ | Keys], [_ |Values], Value) :- 
    find_matching(Key, Keys, Values, Value).

find_path_aux(Start, Start, _, _, [Start]).
find_path_aux(Start, Goal, Parents, 
              Children, [Goal | Rest]) :-
    find_matching(Goal, Children, Parents, NewGoal),
    find_path_aux(Start, NewGoal, Parents, Children, Rest).

find_path(Start, Goal, Parents, Children, Path) :-
    find_path_aux(Start, Goal, Parents, Children, Temp),
    reverse(Temp, Path).
    
    


    

% find_path(a, d, [a, b, c], [b, c, d], Path)