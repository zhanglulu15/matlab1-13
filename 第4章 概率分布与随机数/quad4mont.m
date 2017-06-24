function [V0,Vm] = quad4mont(n)
%   [V0,Vm] = quad4mont(n), ���ؿ��巽������4�ػ��֣���������ֵV0��ģ��ֵVm. 
%   �������n�����Ͷ��ĸ���������������������������.
% CopyRight��xiezhh

% �������ۻ���ֵ����ͳ��ֵ�㷨����integral��integral3��MATLAB R2012a���еĺ���
fun = @(x1,x2,x3,x4)exp(x1.*x2.*x3.*x4);
fun = @(x)arrayfun(@(x1)integral3(@(x2,x3,x4)fun(x1,x2,x3,x4),0,1,0,1,0,1),x);
V0 = integral(fun,0,1);

fun = @(x)exp(prod(x,2));  % ���屻������
% ����������ؿ���ģ��ֵ
for i = 1:length(n)
    x = rand(n(i),4);      % �������n(i)��4ά��λ���������ڵĵ�
    Vm(i) = mean(fun(x));  % ����ֵ�ģ��ֵ
end