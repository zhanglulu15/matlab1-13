function Sm = quad1mont2(n)
%   Sm = quad1mont2(n),������ y = sqrt(x)��ֱ�� y = x ��Χ�ɵ���Ӱ�����
%   ��������ؿ���ģ��ֵSm. �������n�����Ͷ��ĸ���������������������������.
% CopyRight��xiezhh

fun = @(x)sqrt(x)-x;           % ���屻������
% ������Ӱ�������������ؿ���ģ��ֵ
for i = 1:length(n)
    x = rand(n(i),1);          % ���Ͷ��
    Sm(i) = mean(fun(x));      % ���ֵ�ģ��ֵ
end