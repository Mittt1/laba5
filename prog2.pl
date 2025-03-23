start :-
    write('������� ������ ����� (����� �������, � ���������� �������): '),
    read(List),
    min_odd(List, MinOdd),
    write('����������� �������� ������� � ������: '), write(MinOdd), nl.

% �������� ��� ���������� ��� ��������� ��������
min_odd(List, MinOdd) :-
    findall(X, (member(X, List), 0 =\= X mod 2), OddList), % �������� ��� �������� � ����� ������
    min_list(OddList, MinOdd). % ������� ��� � ������ �������� (�������������� �� ������)
