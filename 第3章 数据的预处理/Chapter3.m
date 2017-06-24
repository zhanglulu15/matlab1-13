%--------------------------------------------------------------------------
%  ��3��   ���ݵ�Ԥ����
%--------------------------------------------------------------------------
% CopyRight��xiezhh

%% examp3.1-1
t = linspace(0,2*pi,500)';
y = 100*sin(t);

noise = normrnd(0,15,500,1);
y = y + noise;
figure;
plot(t,y);
xlabel('t');
ylabel('y = sin(t) + ����');

yy1 = smooth(y,30);
figure;
plot(t,y,'k:');
hold on;
plot(t,yy1,'k','linewidth',3);
xlabel('t');
ylabel('moving');
legend('���벨��','ƽ������');

yy2 = smooth(y,30,'lowess');
figure;
plot(t,y,'k:');
hold on;
plot(t,yy2,'k','linewidth',3);
xlabel('t');
ylabel('lowess');
legend('���벨��','ƽ������');

yy3 = smooth(y,30,'rlowess');
figure;
plot(t,y,'k:');
hold on;
plot(t,yy3,'k','linewidth',3);
xlabel('t');
ylabel('rlowess');
legend('���벨��','ƽ������');

yy4 = smooth(y,30,'loess');
figure;
plot(t,y,'k:');
hold on;
plot(t,yy4,'k','linewidth',3);
xlabel('t');
ylabel('loess');
legend('���벨��','ƽ������');

yy5 = smooth(y,30,'sgolay',3);
figure;
plot(t,y,'k:');
hold on;
plot(t,yy5,'k','linewidth',3);
xlabel('t');
ylabel('sgolay');
legend('���벨��','ƽ������');

%% examp3.1-2
x = xlsread('examp03_02.xls');
price = x(:,4)';
figure;
plot(price,'k','LineWidth',2);

xlabel('�۲����'); ylabel('�Ϻ����������̼�');

output1 = smoothts(price,'b',30);
output2 = smoothts(price,'b',100);
figure;
plot(price,'.');
hold on
plot(output1,'k','LineWidth',2);
plot(output2,'k-.','LineWidth',2);
xlabel('�۲����'); ylabel('Box method');
legend('ԭʼɢ��','ƽ������(����30)','ƽ������(����100)','location','northwest');

output3 = smoothts(price,'g',30);
output4 = smoothts(price,'g',100,100);
figure;
plot(price,'.');
hold on
plot(output3,'k','LineWidth',2);
plot(output4,'k-.','LineWidth',2);
xlabel('�۲����'); ylabel('Gaussian window method');
legend('ԭʼɢ��','ƽ������(����30����׼��0.65)',...
          'ƽ������(����100����׼��100)','location','northwest');

output5 = smoothts(price,'e',30);
output6 = smoothts(price,'e',100);
figure;
plot(price,'.');
hold on
plot(output5,'k','LineWidth',2);
plot(output6,'k-.','LineWidth',2);
xlabel('�۲����'); ylabel('Exponential method');
legend('ԭʼɢ��','ƽ������(����30)','ƽ������(����100)','location','northwest');

%% examp3.1-3
t = linspace(0,2*pi,500)';
y = 100*sin(t);
noise = normrnd(0,15,500,1);
y = y + noise;
figure;
plot(t,y);
xlabel('t');
ylabel('y = sin(t) + ����');

yy = medfilt1(y,30);
figure;
plot(t,y,'k:');
hold on
plot(t,yy,'k','LineWidth',3);
xlabel('t');
ylabel('��ֵ�˲�');
legend('���벨��','ƽ������');

%% examp3.2-1
rand('seed',1);
x = [rand(5,1), 5*rand(5,1), 10*rand(5,1), 500*rand(5,1)]

% ����zscore������x���б�׼���任�����б�׼����
[xz,mu,sigma] = zscore(x)

mean(xz)
std(xz)

x0 = bsxfun(@plus, bsxfun(@times, xz, sigma), mu)    % ���׼���任

%% examp3.3-1
rand('seed',1);
x = [rand(5,1), 5*rand(5,1), 10*rand(5,1), 500*rand(5,1)]

% ����rscore������x���н��м����һ���任
[R,xmin,xrange] = rscore(x)

x0 = bsxfun(@plus, bsxfun(@times, R, xrange), xmin)    % �漫���һ���任

%% examp3.3-2
rand('seed',1);
x = [rand(5,1), 5*rand(5,1), 10*rand(5,1), 500*rand(5,1)]

% ����mapminmax������ת�ú��x���н��м����һ���任��
[y,Ps] = mapminmax(x', 0, 1);
y'    % �鿴�任�����

x0 = mapminmax('reverse',y,Ps)'    % ��任