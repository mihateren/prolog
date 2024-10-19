:- consult('standard_predicates.pl'). 
:- consult('special_predicates.pl'). 

:- initialization(main).

main :-
    write('Enter list: '),
    read(InputList),
    write('Deleting last three elements...'), nl,
    remove_last_three(InputList, TrimmedList),
    write('List after removing last three elements: '),
    write(TrimmedList), nl,
    write('Checking if list is sorted: '),
    (is_sorted(TrimmedList) ->
        write('List is sorted.')
    ;
        write('List is not sorted.')
    ),
    nl, halt.
