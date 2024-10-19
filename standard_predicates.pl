my_length([], 0).
my_length([_|Tail], Length) :-  
    my_length(Tail, TailLength),  
    Length is TailLength + 1.  

my_member(X, [X|_]).  
my_member(X, [_|Tail]) :-  
    my_member(X, Tail).  

my_append([], L, L).  
my_append([H|T], L, [H|Result]) :-  
    my_append(T, L, Result).  

my_remove(X, [X|Tail], Tail).  
my_remove(X, [H|Tail], [H|Result]) :-  
    my_remove(X, Tail, Result).  

my_permute([], []).  
my_permute(L, [H|P]) :-  
    my_remove(H, L, R),  
    my_permute(R, P).  

my_sublist(Sublist, List) :-  
    my_append(_, Suffix, List),  
    my_append(Sublist, _, Suffix).
