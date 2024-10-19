:- consult('two.pl').

average_grade(Subject, Average) :-
    findall(Grade, grade(_, _, Subject, Grade), Grades),
    length(Grades, Count),
    Count > 0,
    sum_list(Grades, Sum),
    Average is Sum / Count.

print_average_grades :-
    findall(Subject, grade(_, _, Subject, _), Subjects),
    list_to_set(Subjects, UniqueSubjects),
    forall(member(Subject, UniqueSubjects),
           (average_grade(Subject, Average),
            format('Средний балл по ~w: ~2f~n', [Subject, Average]))).

failing_students(Group, Count) :-
    findall(Student, 
            (grade(Group, Student, _, Grade), Grade < 3), 
            FailingStudents),
    list_to_set(FailingStudents, UniqueFailingStudents),
    length(UniqueFailingStudents, Count).

print_failing_students :-
    findall(Group, grade(Group, _, _, _), Groups),
    list_to_set(Groups, UniqueGroups),
    forall(member(Group, UniqueGroups),
           (failing_students(Group, Count),
            format('Количество не сдавших студентов в группе ~w: ~d~n', [Group, Count]))).

failing_students_subject(Subject, Count) :-
    findall(Student, 
            (grade(_, Student, Subject, Grade), Grade < 3), 
            FailingStudents),
    list_to_set(FailingStudents, UniqueFailingStudents),
    length(UniqueFailingStudents, Count).

print_failing_students_subject :-
    findall(Subject, grade(_, _, Subject, _), Subjects),
    list_to_set(Subjects, UniqueSubjects),
    forall(member(Subject, UniqueSubjects),
           (failing_students_subject(Subject, Count),
            format('Количество не сдавших студентов по предмету ~w: ~d~n', [Subject, Count]))).

run_tasks :-
    print_average_grades,
    print_failing_students,
    print_failing_students_subject.
