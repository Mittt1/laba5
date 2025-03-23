start :-
    write('Введите список чисел (через запятую, в квадратных скобках): '),
    read(List),
    min_odd(List, MinOdd),
    write('Минимальный нечетный элемент в списке: '), write(MinOdd), nl.

% Предикат для нахождения мин нечетного элемента
min_odd(List, MinOdd) :-
    findall(X, (member(X, List), 0 =\= X mod 2), OddList), % Собираем все нечетные в новый список
    min_list(OddList, MinOdd). % Находим мин в списке нечетных (гарантированно не пустом)
