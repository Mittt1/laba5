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

    % Проверяем равенство множеств
    (   subset(Left, Right), subset(Right, Left)  % Left ⊆ Right и Right ⊆ Left <=> Left = Right
    ->  write('Первый дистрибутивный закон доказан.')
    ;   write('Первый дистрибутивный закон не выполняется.')
    ).

% Предикат для объединения двух множеств (удаляет повторения) - оптимизирован для множеств
union(A, B, Union) :-
    append(A, B, Union).
