function [V0,Vm] = quad3mont(n)
%   [V0,Vm] = quad3mont(n), ���ؿ��巽������3�ػ��֣���������ֵV0��ģ��ֵVm. 
%   �������n�����Ͷ��ĸ���������������������������.
% CopyRight��xiezhh

% �������ۻ���ֵ����ͳ��ֵ�㷨����integral3��MATLAB R2012a���еĺ���
fun = @(x,y,z)x.*y.*z;
ymin = @(x)x;
ymax = @(x)2*x;
zmin = @(x,y)x.*y;
zmax = @(x,y)2*x.*y;
V0 = integral3(fun,1,2,ymin,ymax,zmin,zmax);

% ���챻��������x�ǳ�Ϊ3�����������������Ϊ3����x��ÿһ�б�ʾ3ά�ռ��е�һ����
fun = @(x)prod(x);
% ����������ؿ���ģ��ֵ
for i = 1:length(n)
    % �������壨1<=x<=1, 1<=y<=4, 1<=z<=16�������Ͷn(i)����
    x = unifrnd(1,2,1,n(i));                      % x����
    y = unifrnd(1,4,1,n(i));                      % y����
    z = unifrnd(1,16,1,n(i));                     % z����
    X = [x;y;z];
    id = (y>=x)&(y<=2*x)&(z>=x.*y)&(z<=2*x.*y);   % ������������ڵ����������
    Vm(i) = (4-1)*(16-1)*sum(fun(X(:,id)))/n(i);  % ����ֵ�ģ��ֵ
end