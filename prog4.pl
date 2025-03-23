% ������������� ���������
start :-
    write('����� ������� �������� �� ���������� � �����������'), nl,
    order_boxers(Order),
    write('�������: '), write(Order),
    nl.



% �����, ������������ ����� ��������
boxer(thomas_g).
boxer(herbert_f).
boxer(francis_j).
boxer(james_t).


% �����, ����������� ��������� ���� ����� ���������
% stronger(X, Y) ��������, ��� ������ X ������� ������� Y

stronger(herbert_f, thomas_g).  % ������� ������� ������� ������ ��������
stronger(francis_j, thomas_g). % ������� ������ ������� ������ ��������
stronger(francis_j, herbert_f). % ������� ������ ������� �������� ��������
stronger(james_t, herbert_f).  % ������ ����� ������� �������� ��������
stronger(herbert_f, francis_j). % ������� ������� ������� �������� �������

% ������� ��� ������������� ��������� "�������"
stronger(X, Y) :-
    stronger(X, Z),
    stronger(Z, Y).

% ������� ��� ����������� ������� �������� �� ���������� � �����������
order_boxers(Order) :-
    findall(Boxer, boxer(Boxer), Boxers), % ����� ���� ��������
    permutation(Boxers, Order),        % ������������� ��� ��������� ������������
    check_order(Order).                % ���������, ������������� �� ������������ ��������



% ������� ��� �������� �������: ������ ������ � ������ ������ ���� ������� �����������
check_order([_]).  % ������� ������: ������ �� ������ ������� ������ �������
check_order([X, Y | Rest]) :-
    stronger(Y, X),    % ���������, ��� Y ������� X
    check_order([Y | Rest]). % ���������� ��������� ��������� ����� ������
