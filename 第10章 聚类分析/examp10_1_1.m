%--------------------------------------------------------------------------
%  examp10.1-1  ϵͳ����
%--------------------------------------------------------------------------
% CopyRight��xiezhh

%****************************������10.1-1�ľ������*************************
x = [1, 2, 6, 8, 11]';
y = pdist(x)
D = squareform(y)


%**************************����ԭʼ���ݴ���ϵͳ������************************
x = [1, 2, 6, 8, 11]';
Z = linkage(x, 'single', 'cityblock')


%***************************�ֲ����࣬���ƾ�������ͼ*************************
x = [1 2 6 8 11]';
y = pdist(x,'cityblock');
z = linkage(y);
obslabel = {'G1 = {1}';'G2 = {2}';'G3 = {6}';'G4 = {8}';'G5 = {11}'};
[H,T] = dendrogram(z,'orientation','Right','labels',obslabel);
set(H,'LineWidth',2,'Color','k')
xlabel('�������')
text(1.1,1.65,'G6')
text(2.1,3.65,'G7')
text(3.1,4.4,'G8')
text(4.1,3,'G9')



%*******************����7��ϵͳ���෨��Ӧ��Cophenetic���ϵ��****************
x = [1 2 6 8 11]';
y = pdist(x,'cityblock');
method={'average','centroid','complete','median','single','ward','weighted'};

for i = 1:7
    Z = linkage(y,method{i});
    c(i) = cophenet(Z,y);
end
c

Z = linkage(y, 'average');
[c, d] = cophenet(Z,y)
RHO = corr(y',d')


%*************************����cluster��������ϵͳ����************************
x = [1 2 6 8 11]';
y = pdist(x,'cityblock');
z = linkage(y);
T = cluster(z,'maxclust',3)


%***********************����clusterdata��������ϵͳ����**********************
x = [1 2 6 8 11]';
T = clusterdata(x,'maxclust',3)


%--------------------------------------------------------------------------
%  examp10.1-1  K��ֵ����
%--------------------------------------------------------------------------

x = [1 2 6 8 11]';
opts = statset('Display','final');
idx = kmeans(x,3,'Distance','city','Replicates',5,'Options',opts)


%****************************���ƾ�������ͼ*********************************
x = [1 2 6 8 11]';
idx = kmeans(x,3,'Distance','city','Replicates',5);   
[S, H] = silhouette(x,idx)