% Дружественный интерфейс
start :-
    write('Поиск порядка боксеров от слабейшего к сильнейшему'), nl,
    order_boxers(Order),
    write('Порядок: '), write(Order),
    nl.



% Факты, определяющие имена боксеров
boxer(thomas_g).
boxer(herbert_f).
boxer(francis_j).
boxer(james_t).


% Факты, описывающие отношения силы между боксерами
% stronger(X, Y) означает, что боксер X сильнее боксера Y

stronger(herbert_f, thomas_g).  % Герберт Френсис сильнее Томаса Герберта
stronger(francis_j, thomas_g). % Френсис Джеймс сильнее Томаса Герберта
stronger(francis_j, herbert_f). % Френсис Джеймс сильнее Герберта Френсиса
stronger(james_t, herbert_f).  % Джеймс Томас сильнее Герберта Френсиса
stronger(herbert_f, francis_j). % Герберт Френсис сильнее Френсиса Джеймса

% Правило для транзитивного отношения "сильнее"
stronger(X, Y) :-
    stronger(X, Z),
    stronger(Z, Y).

% Правило для определения порядка боксеров от слабейшего к сильнейшему
order_boxers(Order) :-
    findall(Boxer, boxer(Boxer), Boxers), % Найти всех боксеров
    permutation(Boxers, Order),        % Сгенерировать все возможные перестановки
    check_order(Order).                % Проверить, удовлетворяет ли перестановка условиям



% Правило для проверки порядка: каждый боксер в списке должен быть сильнее предыдущего
check_order([_]).  % Базовый случай: список из одного боксера всегда валиден
check_order([X, Y | Rest]) :-
    stronger(Y, X),    % Убедиться, что Y сильнее X
    check_order([Y | Rest]). % Рекурсивно проверить остальную часть списка
