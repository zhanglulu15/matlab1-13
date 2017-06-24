%--------------------------------------------------------------------------
%   ��7��   Copula���ۼ�Ӧ��ʵ��
%--------------------------------------------------------------------------
% CopyRight��xiezhh

%% examp7.4-1
%******************************��ȡ����*************************************
hushi = xlsread('hushi.xls');
X = hushi(:,5);
shenshi = xlsread('shenshi.xls');
Y = shenshi(:,5);


%****************************����Ƶ��ֱ��ͼ*********************************
[fx, xc] = ecdf(X);
figure;
ecdfhist(fx, xc, 30);
xlabel('������������');
ylabel('f(x)');
[fy, yc] = ecdf(Y);
figure;
ecdfhist(fy, yc, 30);
xlabel('������������');
ylabel('f(y)');


%****************************����ƫ�Ⱥͷ��*********************************
xs = skewness(X)
ys = skewness(Y)

kx = kurtosis(X)
ky = kurtosis(Y)


%******************************��̬�Լ���***********************************
[h,p] = jbtest(X)
[h,p] = kstest(X,[X,normcdf(X,mean(X),std(X))])
[h, p] = lillietest(X)

[h,p] = jbtest(Y)
[h,p] = kstest(Y,[Y,normcdf(Y,mean(Y),std(Y))])
[h, p] = lillietest(Y)


%****************************����ֲ�����ֵ*******************************
[fx, Xsort] = ecdf(X);
[fy, Ysort] = ecdf(Y);
U1 = spline(Xsort(2:end),fx(2:end),X);
V1 = spline(Ysort(2:end),fy(2:end),Y);


%*******************************�˷ֲ�����**********************************
U2 = ksdensity(X,X,'function','cdf');
V2 = ksdensity(Y,Y,'function','cdf');


% **********************���ƾ���ֲ�����ͼ�ͺ˷ֲ�����ͼ**********************
[Xsort,id] = sort(X);
figure;
plot(Xsort,U1(id),'c','LineWidth',5);
hold on
plot(Xsort,U2(id),'k-.','LineWidth',2);
legend('����ֲ�����','�˷ֲ�����', 'Location','NorthWest');
xlabel('������������');
ylabel('F(x)');

[Ysort,id] = sort(Y);
figure;
plot(Ysort,V1(id),'c','LineWidth',5);
hold on
plot(Ysort,V2(id),'k-.','LineWidth',2);
legend('����ֲ�����','�˷ֲ�����', 'Location','NorthWest');
xlabel('������������');
ylabel('F(x)');


%****************************���ƶ�ԪƵ��ֱ��ͼ*****************************
U = ksdensity(X,X,'function','cdf');
V = ksdensity(Y,Y,'function','cdf');
figure;
hist3([U(:) V(:)],[30,30])
xlabel('U�����У�');
ylabel('V�����У�');
zlabel('Ƶ��');


%****************************���ƶ�ԪƵ��ֱ��ͼ*****************************
figure;
hist3([U(:) V(:)],[30,30])
h = get(gca, 'Children');
cuv = get(h, 'ZData');
set(h,'ZData',cuv*30*30/length(X));
xlabel('U�����У�');
ylabel('V�����У�');
zlabel('c(u,v)');


%***********************��Copula�в����Ĺ���ֵ******************************
rho_norm = copulafit('Gaussian',[U(:), V(:)])
[rho_t,nuhat,nuci] = copulafit('t',[U(:), V(:)])


%********************����Copula���ܶȺ����ͷֲ�����ͼ************************
[Udata,Vdata] = meshgrid(linspace(0,1,31));
Cpdf_norm = copulapdf('Gaussian',[Udata(:), Vdata(:)],rho_norm);
Ccdf_norm = copulacdf('Gaussian',[Udata(:), Vdata(:)],rho_norm);
Cpdf_t = copulapdf('t',[Udata(:), Vdata(:)],rho_t,nuhat);
Ccdf_t = copulacdf('t',[Udata(:), Vdata(:)],rho_t,nuhat);

% ���ƶ�Ԫ��̬Copula���ܶȺ����ͷֲ�����ͼ
figure;
surf(Udata,Vdata,reshape(Cpdf_norm,size(Udata)));
xlabel('U');
ylabel('V');
zlabel('c(u,v)');
figure;
surf(Udata,Vdata,reshape(Ccdf_norm,size(Udata)));
xlabel('U');
ylabel('V');
zlabel('C(u,v)');

% ���ƶ�Ԫt-Copula���ܶȺ����ͷֲ�����ͼ
figure;
surf(Udata,Vdata,reshape(Cpdf_t,size(Udata)));
xlabel('U');
ylabel('V');
zlabel('c(u,v)');
figure;
surf(Udata,Vdata,reshape(Ccdf_t,size(Udata)));
xlabel('U');
ylabel('V');
zlabel('C(u,v)');


%**************��Kendall�����ϵ����Spearman�����ϵ��***********************
Kendall_norm = copulastat('Gaussian',rho_norm)
Spearman_norm = copulastat('Gaussian',rho_norm,'type','Spearman')
Kendall_t = copulastat('t',rho_t)
Spearman_t = copulastat('t',rho_t,'type','Spearman')
% MATLAB R2014a�汾���÷�
% Spearman_t = copulastat('t',rho_t,nuhat,'type','Spearman')

Kendall = corr([X,Y],'type','Kendall')
Spearman = corr([X,Y],'type','Spearman')


%******************************ģ������*************************************
[fx, Xsort] = ecdf(X);
[fy, Ysort] = ecdf(Y);
U = spline(Xsort(2:end),fx(2:end),X);
V = spline(Ysort(2:end),fy(2:end),Y);
C = @(u,v)mean((U <= u).*(V <= v));
[Udata,Vdata] = meshgrid(linspace(0,1,31));
for i=1:numel(Udata)
    CopulaEmpirical(i) = C(Udata(i),Vdata(i));
end

figure;
% ���ƾ���Copula�ֲ�����ͼ��
surf(Udata,Vdata,reshape(CopulaEmpirical,size(Udata)))
xlabel('U');
ylabel('V');
zlabel('Empirical Copula C(u,v)');

% ͨ��ѭ�����㾭��Copula������ԭʼ�����㴦�ĺ���ֵ
CUV = zeros(size(U(:)));
for i=1:numel(U)
    CUV(i) = C(U(i),V(i));
end

% ����������ز���Ϊ0.9264�Ķ�Ԫ��̬Copula������ԭʼ�����㴦�ĺ���ֵ
rho_norm = 0.9264;
Cgau = copulacdf('Gaussian',[U(:), V(:)],rho_norm);
% ����������ز���Ϊ0.9325�����ɶ�Ϊ4�Ķ�Ԫt-Copula������ԭʼ�����㴦�ĺ���ֵ
rho_t = 0.9325;
k = 4.0089;
Ct = copulacdf('t',[U(:), V(:)],rho_t,k);
% ����ƽ��ŷ�Ͼ���
dgau2 = (CUV-Cgau)'*(CUV-Cgau)
dt2 = (CUV-Ct)'*(CUV-Ct)
