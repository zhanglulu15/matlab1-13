function  p = SheepAndCar(n)
%   p = SheepAndCar(n)���������ؿ��巽���������������⣬������߸���ѡ��֮��
%   Ӯ�������ĸ���p. �����n����������������������ʾ��������Ĵ�����
%   
%   Copyright  xiezhh. 
   
for i = 1:length(n)
    x = randsample(3,n(i),true);  % �������
    p(i) = sum(x~=3)/n(i);  % ���ʵ�ģ��ֵ
end