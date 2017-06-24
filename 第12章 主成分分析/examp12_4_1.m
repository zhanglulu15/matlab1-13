%--------------------------------------------------------------------------
%  examp12.4-1  ��ȡexamp12_4_1.xls�����ݣ��������ɷַ���
%--------------------------------------------------------------------------

%**************************��ȡ���ݣ������б�׼���任************************
[X,textdata] = xlsread('examp12_4_1.xls');
XZ = zscore(X);


%**********************************���ɷַ���*******************************
% ����princomp�������ݱ�׼����ԭʼ�����۲����������ɷַ���
[COEFF,SCORE,latent,tsquare] = princomp(XZ)

% Ϊ��ֱ�ۣ�����Ԫ������result1�������������ֵ�������ʺ��ۻ������ʵ�����
explained = 100*latent/sum(latent);
[m, n] = size(X);
result1 = cell(n+1, 4);
result1(1,:) = {'����ֵ', '��ֵ', '������', '�ۻ�������'};
result1(2:end,1) = num2cell(latent);
result1(2:end-1,2) = num2cell(-diff(latent));
result1(2:end,3:4) = num2cell([explained, cumsum(explained)])

% Ϊ��ֱ�ۣ�����Ԫ������result2���������ǰ2�����ɷֱ��ʽ��ϵ������
varname = textdata(3,2:end)';
result2 = cell(n+1, 3);
result2(1,:) = {'��׼������', '��������t1', '��������t2'};
result2(2:end, 1) = varname;
result2(2:end, 2:end) = num2cell(COEFF(:,1:2))

% Ϊ��ֱ�ۣ�����Ԫ������result3���������ÿһ�������ܵ�������֧�����Լ�ǰ2�����ɷֵĵ÷�����
cityname = textdata(4:end,1);
sumXZ = sum(XZ,2);
[s1, id] = sortrows(SCORE,1);
result3 = cell(m+1, 4);
result3(1,:) = {'����', '��֧��', '��һ���ɷֵ÷�y1', '�ڶ����ɷֵ÷�y2'}; 
result3(2:end, 1) = cityname(id);
result3(2:end, 2:end) = num2cell([sumXZ(id), s1(:,1:2)])

% Ϊ��ֱ�ۣ�����Ԫ������result4���������ǰ2�����ɷֵĵ÷����ݣ��Լ�(ʳƷ+����)-(����+ҽ��)
cloth = sum(XZ(:,[1,8]),2) - sum(XZ(:,[2,7]),2);
[s2, id] = sortrows(SCORE,2);
result4 = cell(m+1, 4);
result4(1,:) = {'����','��һ���ɷֵ÷�y1','�ڶ����ɷֵ÷�y2' ,'(ʳ+����)-(��+ҽ)'};
result4(2:end, 1) = cityname(id);
result4(2:end, 2:end) = num2cell([s2(:,1:2), cloth(id)])


%***************************ǰ�������ɷֵ÷�ɢ��ͼ***************************
plot(SCORE(:,1),SCORE(:,2),'ko');
xlabel('��һ���ɷֵ÷�');
ylabel('�ڶ����ɷֵ÷�');
gname(cityname);


%**********************���ݻ�����T2ͳ����Ѱ�Ҽ�������************************
result5 = sortrows([cityname, num2cell(tsquare)],2);
[{'����', '������T^2ͳ����'}; result5]


%**************************����pcares�����ؽ��۲�����************************
for i = 1 : 8
     residuals = pcares(X, i);
     Rate = residuals./X;
     E1(i) = sqrt(mean(residuals(:).^2));
     E2(i) = sqrt(mean(Rate(:).^2));
end
E1
E2