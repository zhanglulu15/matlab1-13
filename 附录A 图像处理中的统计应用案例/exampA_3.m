%--------------------------------------------------------------------------
%  exampA.3-1  ������λ���㷨���˶�Ŀ����
%--------------------------------------------------------------------------
% CopyRight��xiezhh

%% ��1��ʵ�ַ���
%*******************************��ȡ��Ƶ����********************************
% ����aviread������ȡ��Ƶ�ļ�
vid = aviread('WalkingMan.avi')
size(vid(1).cdata)
vid(1).colormap

%*****************************�������͵�ת��********************************
% ��vid��cdata�ֶε�ȡֵת����һ��240��360��3��80����ά˫��������IM
IM = cat(4,vid.cdata);
size(IM)
IM = double(IM)/255;


%********************����median��������λ����������Ƶͼ��ָ�****************
I = median(IM,4);
figure;
imshow(I);                  % ��ʾ����ͼ��
figure;
imshow(IM(:,:,:,1) - I);    % ��ʾ��1֡�е�Ŀ��ͼ��



%%  ��2��ʵ�ַ���
WalkManObj = mmreader('WalkingMan.avi');
IM = read(WalkManObj, [1, inf]);
IM = double(IM)/255;
I = median(IM,4);
figure;
imshow(I);                  % ��ʾ����ͼ��
figure;
imshow(IM(:,:,:,1) - I);    % ��ʾ��1֡�е�Ŀ��ͼ��


%% ��3��ʵ�ַ���
WalkManObj = VideoReader('WalkingMan.avi');
IM = WalkManObj.read;
IM = double(IM)/255;
I = median(IM,4);
figure;
imshow(I);                  % ��ʾ����ͼ��
figure;
imshow(IM(:,:,:,1) - I);    % ��ʾ��1֡�е�Ŀ��ͼ��