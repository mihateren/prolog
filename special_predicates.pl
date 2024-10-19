:- consult('standard_predicates.pl'). 

remove_last_three(L, Result) :-
    my_length(L, Len),       
    Len >= 3,                
    NewLen is Len - 3,       
    my_length(Result, NewLen),  
    my_append(Result, _, L).  

remove_last_three_manual(L, Result) :-
    remove_last_three_helper(L, 0, Result).

remove_last_three_helper([_,_,_], _, []).  
remove_last_three_helper([H|T], Count, [H|Result]) :-  
    remove_last_three_helper(T, Count, Result).

is_sorted([]).  
is_sorted([_]).  
is_sorted([A, B|Tail]) :-  
    A =< B,               
    is_sorted([B|Tail]).  

is_sorted_manual([]).  
is_sorted_manual([_]).  
is_sorted_manual([A, B|Tail]) :-  
    A =< B,               
    is_sorted_manual([B|Tail]).
