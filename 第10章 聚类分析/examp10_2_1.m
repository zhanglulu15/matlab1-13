%--------------------------------------------------------------------------
%  examp10.2-1  ��ȡexamp10_2_1.xls�����ݣ�������Ʒϵͳ����
%--------------------------------------------------------------------------
% CopyRight��xiezhh

%***************************��ȡ���ݣ������б�׼��***************************
[X,textdata] = xlsread('examp10_2_1.xls');
X = zscore(X);


%*********************����clusterdata��������һ������************************
obslabel = textdata(2:end,1);
Taverage = clusterdata(X,'linkage','average','maxclust',3);
obslabel(Taverage == 1)
obslabel(Taverage == 2)
obslabel(Taverage == 3)


%******************************* �ֲ����� **********************************
y = pdist(X);
Z = linkage(y,'average')

obslabel = textdata(2:end,1);
H = dendrogram(Z,0,'orientation','right','labels',obslabel);
set(H,'LineWidth',2,'Color','k');
xlabel('��׼�����루��ƽ������')

inconsistent0 = inconsistent(Z,40)