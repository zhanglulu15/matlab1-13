%--------------------------------------------------------------------------
%  exampA.2-1  ����K��ֵ�����ͼ��ָ���Ҷ�ͼ��
%--------------------------------------------------------------------------
% CopyRight��xiezhh

%*******************************��ȡͼ������********************************
x = imread('coins.png');
whos x
y = double(x(:));


%*************************����kmeans�������о���ָ�*************************
startdata = [0; 150];
idpixel = kmeans(y,2,'Start',startdata);
idbw = (idpixel == 2);
result = reshape(idbw, size(x));
imshow(result);



%--------------------------------------------------------------------------
%  exampA.2-2  ����K��ֵ�����ͼ��ָ�����ͼ��
%--------------------------------------------------------------------------

%*******************************��ȡͼ������********************************
Duck0 = imread('littleduck.jpg');
whos  Duck0
[m,n,k] = size(Duck0);
Duck1 = double(reshape(Duck0, m*n, k));
whos  Duck1


%*************************����kmeans�������о���ָ�*************************
startdata = [10 10 200;200 200 10];
idClass = kmeans(Duck1,2,'Start',startdata);
idDuck = (idClass == 1);
result = reshape([idDuck, idDuck, idDuck],[m,n,k]);
Duck2 = Duck0;
Duck2(result) = 0;
figure
imshow(Duck2)