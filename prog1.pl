start :-
    write('¬ведите натуральное число: '),
    read(N),
    first_N(N, First),
    last_N(N, Last),
    Sum is First + Last,
    format('—умма первой и последней цифры:'),
    write(Sum),
    nl.

first_N(N, N) :- N < 10.

first_N(N, First) :-
    N >= 10,
    Next is N // 10,
    first_N(Next, First).


last_N(N, Last) :-
    Last is N mod 10.


