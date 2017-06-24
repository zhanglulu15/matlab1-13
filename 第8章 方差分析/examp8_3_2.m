%--------------------------------------------------------------------------
%  examp8.3-2  ����anovan������������һԪ�������
%--------------------------------------------------------------------------
% CopyRight��xiezhh

% ���ļ�examp8_3_2.xls�ж�ȡ����
ydata = xlsread('examp8_3_2.xls');
y = ydata(:,7);
A = ydata(:,2);
B = ydata(:,3);
C = ydata(:,4);
D = ydata(:,6);
E = ydata(:,5);
varnames = {'A','B','C','D','E'};
model = [eye(5);1 1 0 0 0;1 0 1 0 0;1 0 0 0 1]

% ����anovan������������һԪ�������
[p,table] = anovan(y,{A,B,C,D,E},'model',model,'varnames',varnames)


%********************************�������������*****************************
model = [eye(5);1 0 1 0 0]
[p,table,stats] = anovan(y,{A,B,C,D,E},'model',model,'varnames',varnames);
p
table


%********************************���رȽ�**********************************
[c,m,h,gnames] = multcompare(stats,'dimension',[1 2 3 4 5]);
[mean,id] = sort(m(:,1));
gnames = gnames(id);
[{'����','��ֵ'};gnames(end-19:end),num2cell(mean(end-19:end))]