%--------------------------------------------------------------------------
%  examp10.3-1  ��ȡexamp10_3_1.xls�����ݣ�����K��ֵ����
%--------------------------------------------------------------------------
% CopyRight��xiezhh

%*************************��ȡ���ݣ������б�׼���任*************************
[X, textdata] = xlsread('examp10_3_1.xls');
row = ~any(isnan(X), 2);
X = X(row, :);
countryname = textdata(3:end,1);
countryname = countryname(row);

X = zscore(X);


%*************************ѡȡ��ʼ���۵㣬���о���***************************
startdata = X([8, 27, 42],:);
idx = kmeans(X,3,'Start',startdata);


%****************************** ��������ͼ *********************************
[S, H] = silhouette(X,idx);

countryname(idx == 1)
countryname(idx == 2)
countryname(idx == 3)