%--------------------------------------------------------------------------
%  ��6��  ����������������
%--------------------------------------------------------------------------
% CopyRight��xiezhh

%% examp6.1-1 ���÷ֲ���������
%+++++++++++++++++++++++++����normfit�������+++++++++++++++++++++++++++++++
x = [15.14  14.81  15.11  15.26  15.08  15.17  15.12  14.95  15.05  14.87];
[muhat,sigmahat,muci,sigmaci] = normfit(x,0.1)

%++++++++++++++++++++++++++++����mle�������++++++++++++++++++++++++++++++++
x = [15.14  14.81  15.11  15.26  15.08  15.17  15.12  14.95  15.05  14.87];
[mu_sigma,mu_sigma_ci] = mle(x,'distribution','norm','alpha',0.1)

%% examp6.1-2 �Զ���ֲ���������
x = [0.7917,0.8448,0.9802,0.8481,0.7627
        0.9013,0.9037,0.7399,0.7843,0.8424
        0.9842,0.7134,0.9959,0.6444,0.8362
        0.7651,0.9341,0.6515,0.7956,0.8733];
PdfFun = @(x,theta) theta*x.^(theta-1).*(x>0 & x<1);
[phat,pci] = mle(x(:),'pdf',PdfFun,'start',1)

%% examp6.1-3 ���������
rand('seed',1);
randn('seed',1);
x = normrnd(35,5,1000,1);
y = evrnd(20,2,1000,1);
z = randsrc(1000,1,[1,2;0.6,0.4]);
data = x.*(z==1) + y.*(z==2);
pdffun = @(t,mu1,sig1,mu2,sig2)0.6*normpdf(t,mu1,sig1)+0.4*evpdf(t,mu2,sig2);
[phat,pci] = mle(data,'pdf',pdffun,'start',[10,10,10,10],...
    'lowerbound',[-inf,0,-inf,0],'upperbound',[inf,inf,inf,inf])

%% examp6.2-1 �����׼����֪ʱ�ĵ�����̬�����ֵ�ļ���
%++++++++++++++++++++++++++++++++˫�����++++++++++++++++++++++++++++++++++
x = [97  102  105  112  99  103  102  94  100  95  105  98  102  100  103];
mu0 = 100;
Sigma = 2;
Alpha = 0.05;
[h,p,muci,zval] = ztest(x,mu0,Sigma,Alpha)

%++++++++++++++++++++++++++++++++�������++++++++++++++++++++++++++++++++++
x = [97  102  105  112  99  103  102  94  100  95  105  98  102  100  103];
mu0 = 100;
Sigma = 2;
Alpha = 0.05;
tail = 'right';
[h,p,muci,zval] = ztest(x,mu0,Sigma,Alpha,tail)

%% examp6.2-2 �����׼��δ֪ʱ�ĵ�����̬�����ֵ�ļ���
x = [49.4  50.5  50.7  51.7  49.8  47.9  49.2  51.4  48.9];
mu0 = 50;
Alpha = 0.05;
[h,p,muci,stats] = ttest(x,mu0,Alpha)

%% examp6.2-3 �����׼��δ֪ʱ��������̬�����ֵ�ıȽϼ��飨����������
x = [20.1,  20.0,  19.3,  20.6,  20.2,  19.9,  20.0,  19.9,  19.1,  19.9];
y = [18.6,  19.1,  20.0,  20.0,  20.0,  19.7,  19.9,  19.6,  20.2];
alpha = 0.05;
tail = 'both';
vartype = 'equal';
[h,p,muci,stats] = ttest2(x,y,alpha,tail,vartype)

%% examp6.2-4 �����׼��δ֪ʱ��������̬�����ֵ�ıȽϼ��飨���������
x = [80.3,68.6,72.2,71.5,72.3,70.1,74.6,73.0,58.7,78.6,85.6,78.0];
y = [74.0,71.2,66.3,65.3,66.0,61.6,68.8,72.6,65.7,72.6,77.1,71.5];
Alpha = 0.05;
tail = 'both';
[h,p,muci,stats] = ttest(x,y,Alpha,tail)

%% examp6.2-5 �����ֵδ֪ʱ�ĵ�����̬���巽��ļ���
x = [49.4  50.5  50.7  51.7  49.8  47.9  49.2  51.4  48.9];
var0 = 1.5;
alpha = 0.05;
tail = 'both';
[h,p,varci,stats] = vartest(x,var0,alpha,tail)

%% examp6.2-6 �����ֵδ֪ʱ��������̬���巽��ıȽϼ���
x = [20.1,  20.0,  19.3,  20.6,  20.2,  19.9,  20.0,  19.9,  19.1,  19.9];
y = [18.6,  19.1,  20.0,  20.0,  20.0,  19.7,  19.9,  19.6,  20.2];
alpha = 0.05;
tail = 'both';
[h,p,varci,stats] = vartest2(x,y,alpha,tail)

%% examp6.2-7 ���鹦Ч�����������ļ���
mu0 = 100;
sigma0 = 6.58;
mu1 = 104;
pow = 0.9;
% ����sampsizepwr��������������n
n = sampsizepwr('z',[mu0,sigma0],mu1,pow,[],'tail','right')

n = 1:60;
% ����sampsizepwr������ͬ������������Ӧ�ļ��鹦Ч
pow = sampsizepwr('z',[mu0,sigma0],mu1,[],n,'tail','right');
plot(n,pow,'k');
xlabel('��������');
ylabel('���鹦Ч');

%% examp6.3-3  �γ̼���
x = xlsread('2012˫ɫ�򿪽�����.xls',1,'I2:I98');
[h,p,stats] = runstest(x,[],'method','approximate') 

%% examp6.3-4  ���ż���1
x = [-ones(69,1);zeros(23,1);ones(108,1)];
p = signtest(x)

%% examp6.3-5  ���ż���2
x = [80.3,68.6,72.2,71.5,72.3,70.1,74.6,73.0,58.7,78.6,85.6,78.0];
y = [74.0,71.2,66.3,65.3,66.0,61.6,68.8,72.6,65.7,72.6,77.1,71.5];
p = signtest(x,y)

%% examp6.3-6  Wilcoxon�����ȼ���
x = [20.21,19.95,20.15,20.07,19.91,19.99,20.08,20.16,...
        19.99,20.16,20.09,19.97,20.05,20.27,19.96,20.06];
[p,h,stats] = signrank(x,20)

%% examp6.3-7  Mann-Whitney�Ⱥͼ���
x = [133,112,102,129,121,161,142,88,115,127,96,125];
y = [71,119,101,83,107,134,92];
[p,h,stats] = ranksum(x,y,'method','approximate')

%% examp6.3-8  �ֲ����������鰸��
%*****************************��ȡ�ļ�������********************************
score = xlsread('examp02_14.xls','Sheet1','G2:G52');
score = score(score > 0);


%*******************����chi2gof�������п�������Ŷȼ���***********************
[h,p,stats] = chi2gof(score)

ctrs = [50 60 70 78 85 94];
% ָ��'ctrs'���������п�������Ŷȼ���
[h,p,stats] = chi2gof(score,'ctrs',ctrs)

% ָ��'nbins'���������п�������Ŷȼ���
[h,p,stats] = chi2gof(score,'nbins',6)

% ָ���ֲ�ΪĬ�ϵ���̬�ֲ����ֲ�������x���й���
[h,p,stats] = chi2gof(score,'nbins',6);

ms = mean(score);
ss = std(score);
% ָ��'cdf'����
[h,p,stats] = chi2gof(score,'nbins',6,'cdf',{'normcdf', ms, ss});
[h,p,stats] = chi2gof(score,'nbins',6,'cdf',{@normcdf, ms, ss});

% ͬʱָ��'cdf'��'nparams'����
[h,p,stats] = chi2gof(score,'nbins',6,'cdf',{@normcdf,ms,ss},'nparams',2)

% ����chi2gof�������������Ƿ���ӱ�׼��̬�ֲ�
[h,p] = chi2gof(score,'cdf',@normcdf)

% ָ����ʼ������Ϊ6�������ܳɼ������Ƿ���Ӳ���Ϊms = 79�Ĳ��ɷֲ�
[h,p] = chi2gof(score,'nbins',6,'cdf',{@poisscdf, ms})

% ָ����ʼ������Ϊ6����С����Ƶ��Ϊ3�������ܳɼ������Ƿ������̬�ֲ�
h = chi2gof(score,'nbins',6,'cdf',{@normcdf, ms, ss},'emin',3)


%*************************����jbtest����������̬�Լ���***********************
randn('seed',0)
x = randn(10000,1);
h = jbtest(x)  % ����jbtest����������̬�Լ���

x(end) = 5;  % ������x�����һ��Ԫ�ظ�Ϊ5
h = jbtest(x)  % �ٴε���jbtest����������̬�Լ���

% ����jbtest�����Գɼ����ݽ���Jarque-Bera����
[h,p,jbstat,critval] = jbtest(score)


%*************************����kstest����������̬�Լ���***********************
cdf = [score, normcdf(score, 79, 10.1489)];
% ����kstest�����������ܳɼ��Ƿ������cdfָ���ķֲ�
[h,p,ksstat,cv] = kstest(score,cdf)


%*************����kstest2����������������ܳɼ��Ƿ������ͬ�ķֲ�*************
banji = xlsread('examp02_14.xls','Sheet1','B2:B52');
score = xlsread('examp02_14.xls','Sheet1','G2:G52');
banji = banji(score > 0);
score = score(score > 0);
score1 = score(banji == 60101);
score2 = score(banji == 60102);
% ����kstest2����������������ܳɼ��Ƿ������ͬ�ķֲ�
[h,p,ks2stat] = kstest2(score1,score2)


%*******************�ֱ������������ܳɼ��ľ���ֲ�ͼ***********************
figure;
F1 = cdfplot(score1);
set(F1,'LineWidth',2,'Color','r');
hold on;
F2 = cdfplot(score2);
set(F2,'LineStyle','-.','LineWidth',2,'Color','k');
legend('60101���ܳɼ��ľ���ֲ�����','60102���ܳɼ��ľ���ֲ�����',...
          'Location','NorthWest');


%*************************����kstest2����������̬�Լ���***********************
randn('seed',0)
x = normrnd(mean(score),std(score),10000,1);
% ����kstest2���������ܳɼ�����score�����������x�Ƿ������ͬ�ķֲ�
[h,p] = kstest2(score,x,0.05)


%**********************����lillietest�������зֲ��ļ���**********************
% ����lillietest��������Lilliefors���飬�����ܳɼ������Ƿ������̬�ֲ�
[h,p,kstat,critval] = lillietest(score)

% ����lillietest��������Lilliefors���飬�����ܳɼ������Ƿ����ָ���ֲ�
[h, p] = lillietest(score,0.05,'exp')


%% examp6.4-1  ���ܶȹ��ư���
%*****************************��ȡ�ļ�������********************************
score = xlsread('examp02_14.xls','Sheet1','G2:G52');
score = score(score > 0);


%*****************����Ƶ��ֱ��ͼ�����ܶȹ���ͼ����̬�ֲ��ܶ�ͼ****************
% ����Ƶ��ֱ��ͼ
[f_ecdf, xc] = ecdf(score);
figure;
ecdfhist(f_ecdf, xc, 7);
hold on;
xlabel('���Գɼ�');
ylabel('f(x)');

% ����ksdensity�������к��ܶȹ��ƣ������ƺ��ܶ�ͼ
[f_ks1,xi1,u1] = ksdensity(score);
plot(xi1,f_ks1,'k','linewidth',3)

% ������̬�ֲ��ܶȺ���ͼ
ms = mean(score);
ss = std(score);
f_norm = normpdf(xi1,ms,ss); 
plot(xi1,f_norm,'r-.','linewidth',3);

% Ϊͼ�μӱ�ע��
legend('Ƶ��ֱ��ͼ','���ܶȹ���ͼ', '��̬�ֲ��ܶ�ͼ', 'Location','NorthWest');
u1    %�鿴Ĭ�ϴ���



%**********************���Ʋ�ͬ�����Ӧ�ĺ��ܶȺ���ͼ************************
[f_ks1,xi1] = ksdensity(score,'width',0.1);
[f_ks2,xi2] = ksdensity(score,'width',1);
[f_ks3,xi3] = ksdensity(score,'width',5);
[f_ks4,xi4] = ksdensity(score,'width',9);
figure;
% �ֱ���Ʋ�ͬ�����Ӧ�ĺ��ܶȹ���ͼ�����Ƕ�Ӧ��ͬ�����ͺ���ɫ
plot(xi1,f_ks1,'c-.','linewidth',2);
hold on;
xlabel('���Գɼ�');
ylabel('���ܶȹ���');
plot(xi2,f_ks2,'r:','linewidth',2);
plot(xi3,f_ks3,'k','linewidth',2);
plot(xi4,f_ks4,'b--','linewidth',2);
legend('����Ϊ0.1','����Ϊ1','����Ϊ5','����Ϊ9','Location','NorthWest');



%**********************���Ʋ�ͬ�˺�����Ӧ�ĺ��ܶȺ���ͼ**********************
[f_ks1,xi1] = ksdensity(score,'kernel','normal');
[f_ks2,xi2] = ksdensity(score,'kernel','box');
[f_ks3,xi3] = ksdensity(score,'kernel','triangle');
[f_ks4,xi4] = ksdensity(score,'kernel','epanechnikov');
figure;
% �ֱ���Ʋ�ͬ�˺�����Ӧ�ĺ��ܶȹ���ͼ�����Ƕ�Ӧ��ͬ�����ͺ���ɫ
plot(xi1,f_ks1,'k','linewidth',2);
hold on;
xlabel('���Գɼ�');
ylabel('���ܶȹ���');
plot(xi2,f_ks2,'r:','linewidth',2);
plot(xi3,f_ks3,'b-.','linewidth',2);
plot(xi4,f_ks4,'c--','linewidth',2);
legend('Gaussian','Uniform','Triangle','Epanechnikov','Location','NorthWest');



%***************���ƾ���ֲ����������Ƶķֲ�������������̬�ֲ�ͼ***************
figure;
% ���ƾ���ֲ�����ͼ
[h,stats] = cdfplot(score);
set(h,'color','r', 'LineStyle', ':','LineWidth',2);
hold on;
title ('');
xlabel('���Գɼ�');
ylabel('F(x)');

% ����ksdensity�������ۻ��ֲ��������й��ƣ������ƹ��Ƶķֲ�����ͼ
[f_ks, xi] = ksdensity(score,'function','cdf');
plot(xi,f_ks,'k','linewidth',2);

% ����������̬�ֲ��ķֲ���������
y = normcdf(xi,stats.mean,stats.std);
plot(xi,y,'b-.','LineWidth',2);

legend('����ֲ�����', '���Ƶķֲ�����','������̬�ֲ�','Location','NorthWest');