%--------------------------------------------------------------------------
%  ��4��   ���ʷֲ��������
%--------------------------------------------------------------------------
% CopyRight��xiezhh

%% examp4.1-1
x = 0:10;
Y = normpdf(x, 1.2345, 6)
F = normcdf(x, 1.2345, 6)    % ��ֲ�����ֵ
P = normcdf(5, 1.2345, 6) - normcdf(-2, 1.2345, 6)    % �����

%% examp4.1-2
u = norminv(1-0.05, 0, 1)

t = tinv(1-0.05, 50)

chi2 = chi2inv(1-0.025, 8)

f1 = finv(1-0.01, 7, 13)

f2 = finv(1-0.99, 13, 7)

%% examp4.2-1
x = rand(10)
y = x(:);
hist(y)
xlabel('[0,1]�Ͼ��ȷֲ������');
ylabel('Ƶ��');

%% examp4.2-2
s = RandStream('mlfg6331_64', 'seed', 10, 'NormalTransform', 'Inversion');
x = s.randn(10)
y = x(:);
hist(y);
xlabel('��׼��̬�ֲ������');
ylabel('Ƶ��');

%% examp4.2-3
x = normrnd(75, 8, 1000, 3);
hist(x);
xlabel('��̬�ֲ��������\mu = 75,  \sigma = 8��');
ylabel('Ƶ��');
legend('��һ��', '�ڶ���', '������');

%% examp4.2-4
x = normrnd(repmat([0 15 40], 1000, 1), repmat([1 2 3], 1000, 1), 1000, 3);
hist(x, 50);
xlabel('��̬�ֲ������');
ylabel('Ƶ��');
legend('\mu = 0,  \sigma = 1','\mu = 15,  \sigma = 2','\mu = 40,  \sigma = 3');

%% examp4.2-5
x = random('bino', 10, 0.3, 10000, 1);
[fp, xp] = ecdf(x);
ecdfhist(fp, xp, 50);
xlabel('����ֲ���n = 10, p = 0.3�������');
ylabel('f(x)');

%% examp4.2-6
x = random('chi2', 10, 10000, 1);
[fp, xp] = ecdf(x);
ecdfhist(fp, xp, 50);
hold on;
t = linspace(0, max(x), 100);
y = chi2pdf(t, 10);

plot(t, y, 'r', 'linewidth', 3);
xlabel('x  ( \chi^2(10) )');
ylabel('f(x)');
legend('Ƶ��ֱ��ͼ', '�ܶȺ�������');

%% examp4.2-7
xvalue = [-2 -1 0 1 2];
xp = [0.05 0.2 0.5 0.2 0.05];
x = randsample(xvalue, 100, true, xp);
reshape(x,[10, 10])
tabulate(x)

x = randsample(xvalue, 10000, true, xp);
tabulate(x)

x = randsample(xvalue, 100000, true, xp);
tabulate(x)

%% examp4.2-8
xvalue = 'ABCDE';
xp = [0.05 0.2 0.5 0.2 0.05];
x = randsample(xvalue, 100, true, xp);
reshape(x,[4, 25])
tabulate(x')

%% examp4.2-7��
DistributionList = [-2,-1,0,1,2;0.05,0.2,0.5,0.2,0.05];
x = randsrc(10,10,DistributionList)
tabulate(x(:))

%% examp4.2-9
x = randi([0,10],10,10)
tabulate(x(:))

%% examp4.2-10
pdffun = @(x)6*x*(1-x);
x = slicesample(0.5,1000,'pdf',pdffun);
[fp,xp] = ecdf(x);
ecdfhist(fp,xp,20);
hold on;
fplot(pdffun, [0 1], 'r');
xlabel('x');
ylabel('f(x)');
legend('Ƶ��ֱ��ͼ', '�ܶȺ�������');

%% examp4.2-11
pdffun = @(x)x*(x>=0 & x<1)+(2-x)*(x>=1 & x<2);
x = slicesample(1.5,1000,'pdf',pdffun);
[fp,xp] = ecdf(x);
ecdfhist(fp, xp, 20);
hold on;
fplot(pdffun, [0 2], 'r');
xlabel('x');
ylabel('f(x)');
legend('Ƶ��ֱ��ͼ', '�ܶȺ�������');

%% examp4.2-12
pdffun = @(x)1/(pi*(1+x^2));
x = slicesample(0,1000,'pdf',pdffun,'burnin',100);
[fp,xp] = ecdf(x);
ecdfhist(fp, xp, 100);
hold on;
fplot(pdffun, [-20 20], 'r');
xlabel('x');
ylabel('f(x)');
legend('Ƶ��ֱ��ͼ', '�ܶȺ�������');

%% examp4.2-13
rand('seed',1);
randn('seed',1);
x = normrnd(35,5,1000,1);
y = evrnd(20,2,1000,1);
z = randsrc(1000,1,[1,2;0.6,0.4]);
data = x.*(z==1) + y.*(z==2);
pdffun = @(t,mu1,sig1,mu2,sig2)0.6*normpdf(t,mu1,sig1)+0.4*evpdf(t,mu2,sig2);
xd = linspace(min(data),max(data),100);
yd = pdffun(xd,35,5,20,2);
[fi,xi] = ecdf(data);
ecdfhist(fi,xi,30);
hold on;
plot(xd,yd,'r','linewidth',2);
xlabel('x');
ylabel('f(x)');
legend('Ƶ��ֱ��ͼ', '�ܶȺ�������');

%% examp4.3-1
n = 100;
p = [0.2  0.3  0.5];
r = mnrnd(n, p, 10)

r = mnrnd(n, p, 10000);
hist3(r(:,1:2),[50,50]);
xlabel('X_1');
ylabel('X_2');
zlabel('Ƶ��');

%% examp4.3-2
mu = [10  20];
sigma = [1  3; 3  16];
xy = mvnrnd(mu, sigma, 10000);
hist3(xy, [15, 15]);
xlabel('X');
ylabel('Y');
zlabel('Ƶ��');

%% examp4.4-1
p = SheepAndCar([10,100,1000,10000,100000,1000000])

%% examp4.4-2
[p0,p] = probmont(20,50,10)  % ģ��10��

[p0,p] = probmont(20,50,1000)  % ģ��1000��

[p0,p] = probmont(20,50,10000)  % ģ��10000��

%% examp4.4-3
p = PiMonteCarlo([1000:5000:50000])'  % ����Բ����pi��ģ��ֵ����
PiMonteCarlo([100:50:20000])  % ����ģ��ֵ��Ͷ�������ɢ��ͼ

%% examp4.4-4
[S0,Sm] = quad1mont1([10, 100, 1000,10000,100000, 1000000])
Sm = quad1mont2([10, 100, 1000,10000,100000, 1000000])

%% examp4.4-5
[V0,Vm] = quad2mont1([10, 100, 1000,10000,100000, 1000000])
Vm = quad2mont2([10, 100, 1000,10000,100000, 1000000])

%% examp4.4-6
[V0,Vm] = quad3mont([10, 100, 1000,10000,100000, 1000000])

%% examp4.4-7
[V0,Vm] = quad4mont([10, 100, 1000,10000,100000, 1000000])

%% examp4.4-8
[Em,E0] = GameMont1(100000)  % ģ��100000��

% ��Բ�ͬ��ģ�����������arrayfun��������ģ��ֵ
arrayfun(@GameMont1,[10 100 1000 10000 100000])

[E0,Em] = GameMont2([10, 100, 1000,10000,100000, 1000000])