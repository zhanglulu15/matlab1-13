function [n,y] = SumLeq(m)
%   [n,y] = SumLeq(m)���� y = 1^2 + 2^2 + ... + n^2����ʹ�� y <= m ������n
%                      ����Ӧ��y��
%   
%   Copyright xiezhh

y = 0;
i = 0;
while  y < m
    i = i + 1;
    y = y + i^2;
end
n = i-1;
y = y-i^2;