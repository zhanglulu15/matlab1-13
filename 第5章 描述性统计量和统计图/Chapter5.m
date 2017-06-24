%--------------------------------------------------------------------------
%  ��5��  ������ͳ������ͳ��ͼ
%--------------------------------------------------------------------------
% CopyRight��xiezhh

%% *****************************ͳ����**************************************
%% ���ֵ
score = xlsread('examp02_14.xls','Sheet1','G2:G52');
score = score(score > 0);
score_mean = mean(score)

%% �󷽲�ͱ�׼��
SS1 = var(score)      % ����(5.3-1)ʽ�ķ���
SS1 = var(score,0)    % Ҳ�Ǽ���(5.3-1)ʽ�ķ���
SS2 = var(score,1)    % ����(5.3-2)ʽ�ķ���
s1 = std(score)       % ����(5.3-3)ʽ�ı�׼��
s1 = std(score,0)     % Ҳ�Ǽ���(5.3-3)ʽ�ı�׼��
s2 = std(score,1)     % ����(5.3-4)ʽ�ı�׼��

%% �����ֵ����Сֵ
score_max = max(score)
score_min = min(score)

%% �󼫲�
score_range = range(score)

%% ����λ��
score_median = median(score) 

%% ���λ��
score_m1 = quantile(score,[0.25,0.5,0.75])
score_m2 = prctile(score,[25, 50, 75])

%% ������
score_mode = mode(score) 

%% �����ϵ��
score_cvar = std(score)/mean(score)

%% ��ԭ���
A2 = mean(score.^2)

%% �����ľ�
B1 = moment(score,1)
B2 = moment(score,2)

%% ��ƫ��
score_skewness = skewness(score)

%% ����
score_kurtosis = kurtosis(score)

%% ��Э����
XY = xlsread('examp02_14.xls','Sheet1','E2:F52');
XY = XY(all(XY>0,2),:);
covXY = cov(XY)

%% �����ϵ��
Rxy = corrcoef(XY)


%% *****************************ͳ��ͼ**************************************
%% ����ͼ
score = xlsread('examp02_14.xls','Sheet1','G2:G52');
score = score(score > 0);
figure;
boxlabel = {'���Գɼ�����ͼ'};
boxplot(score,boxlabel,'notch','on','orientation','horizontal')
xlabel('���Գɼ�');

%% Ƶ�����ʣ�ֱ��ͼ
figure;
[f, xc] = ecdf(score);
ecdfhist(f, xc, 7);
xlabel('���Գɼ�');
ylabel('f(x)');
x = 40:0.5:100;
y = normpdf(x,mean(score),std(score));
hold on
plot(x,y,'k','LineWidth',2) 
legend('Ƶ��ֱ��ͼ','��̬�ֲ��ܶ�����','Location','NorthWest');

%% ����ֲ�����ͼ
figure;
[h,stats] = cdfplot(score)
set(h,'color','k','LineWidth',2);
x = 40:0.5:100;
y = normcdf(x,stats.mean,stats.std);
hold on
plot(x,y,':k','LineWidth',2);
legend('����ֲ�����','������̬�ֲ�','Location','NorthWest');

%% ��̬����ͼ
figure;
normplot(score); 

%% p-pͼ
probplot('lognormal',score)

%% q-qͼ
banji = xlsread('examp02_14.xls','Sheet1','B2:B52');
score = xlsread('examp02_14.xls','Sheet1','G2:G52');
banji = banji(score > 0);
score = score(score > 0);
score1 = score(banji == 60101);
score2 = score(banji == 60102);
qqplot(score1,score2)
xlabel('60101 Quantiles');
ylabel('60102 Quantiles');

% **************************Ƶ����Ƶ�ʷֲ���********************************
% ++++++++++++++++++++����tabulate������Ƶ����Ƶ�ʷֲ���+++++++++++++++++++++
%% examp5.5-1
x = [2  2  6  5  2  3  2  4  3  4  3  4  4  4  4  2  2
      6  0  4  7  2  5  8  3  1  3  2  5  3  6  2  3  5
      4  3  1  4  2  2  2  3  1  5  2  6  3  4  1  2  5];
tabulate(x(:))

%% examp5.5-2
x = ['If x is a numeric array, TABLE is a numeric matrix.']';
tabulate(x)

%% examp5.5-3
x = ['�޼ҷ�';'���ˆ�';'����Ⱥ';'������';'�����';'�ߴ���';'�޼ҷ�';
        'Ҷ ��';'������';'л�л�';'����־';'���ˆ�';'�޼ҷ�';'л�л�'];
tabulate(x)

%% examp5.5-4
x = {'�޼ҷ�';'���ˆ�';'����Ⱥ';'������';'�����';'�ߴ���';'�޼ҷ�';
 'Ҷ ��';'������';'л�л�';'����־';'���ˆ�';'�޼ҷ�';'л�л�'};
tabulate(x)

%% examp5.5-5
load fisheriris                 % ����MATLAB�Դ����β������
species = nominal(species);     % ���ַ���Ԫ������speciesתΪ����߶�����
tabulate(species)


% ++++++++++++++++++�����Ա�HistRate������Ƶ����Ƶ�ʷֲ���+++++++++++++++++++
%% examp5.5-1 ��
x = [2  2  6  5  2  3  2  4  3  4  3  4  4  4  4  2  2
      6  0  4  7  2  5  8  3  1  3  2  5  3  6  2  3  5
      4  3  1  4  2  2  2  3  1  5  2  6  3  4  1  2  5];
HistRate(x)

%% examp5.5-2 ��
x = ['If x is a numeric array, TABLE is a numeric matrix.']';
HistRate(x)

%% examp5.5-3 ��
x = ['�޼ҷ�';'���ˆ�';'����Ⱥ';'������';'�����';'�ߴ���';'�޼ҷ�';
        'Ҷ ��';'������';'л�л�';'����־';'���ˆ�';'�޼ҷ�';'л�л�'];
HistRate(x)

%% examp5.5-4 ��
x = {'�޼ҷ�';'���ˆ�';'����Ⱥ';'������';'�����';'�ߴ���';'�޼ҷ�';
 'Ҷ ��';'������';'л�л�';'����־';'���ˆ�';'�޼ҷ�';'л�л�'};
HistRate(x)

%% examp5.5-5 ��
load fisheriris                 % ����MATLAB�Դ����β������
species = nominal(species);     % ���ַ���Ԫ������speciesתΪ����߶�����
HistRate(species)