start :-
    write('Введите множество A (через запятую, в квадратных скобках): '),
    read(A),
    write('Введите множество B (через запятую, в квадратных скобках): '),
    read(B),
    write('Введите множество C (через запятую, в квадратных скобках): '),
    read(C),
    first_distributive(A, B, C),
    nl.

% Предикат для доказательства первого дистрибутивного закона:
% A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
first_distributive(A, B, C) :-
    % Вычисляем левую часть: A ∩ (B ∪ C)
    union(B, C, BUC),       % B ∪ C
    intersection(A, BUC, Left), % A ∩ (B ∪ C)

    % Вычисляем правую часть: (A ∩ B) ∪ (A ∩ C)
    intersection(A, B, AIB), % A ∩ B
    intersection(A, C, AIC), % A ∩ C
    union(AIB, AIC, Right), % (A ∩ B) ∪ (A ∩ C)

    % Выводим результаты вычислений в консоль
    write('Левая часть: A ∩ (B ∪ C) = '), write(Left), nl,
    write('Правая часть: (A ∩ B) ∪ (A ∩ C) = '), write(Right), nl,

    % Проверяем равенство множеств и нетривиальность
    (   subset(Left, Right), subset(Right, Left), (Left \= [] ; Right \= []) % Left = Right и хотя бы одно не пустое
    ->  write('Первый дистрибутивный закон доказан.')
    ;   subset(Left, Right), subset(Right, Left), (Left = [] , Right = [])
    ->  write('Первый дистрибутивный закон не выполняется. Оба множества пусты.')
    ;   write('Первый дистрибутивный закон не выполняется. Множества не равны.')
    ).


% Предикат для объединения двух множеств (удаляет повторения)
union([], B, B).
union([H|T], B, Union) :-
    member(H, B),
    union(T, B, Union).
union([H|T], B, [H|Union]) :-
    \+ member(H, B),
    union(T, B, Union).

% Предикат для пересечения двух множеств
intersection([], _, []).
intersection([H|T], B, [H|Intersection]) :-
    member(H, B),
    intersection(T, B, Intersection).
intersection([_|T], B, Intersection) :-
    intersection(T, B, Intersection).

% Предикат для проверки, является ли одно множество подмножеством другого
subset([], _).
subset([H|T], Set) :-
    member(H, Set),
    subset(T, Set). 
