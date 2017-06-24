%--------------------------------------------------------------------------
%  exampA.4-1  ���ڱ�Ҷ˹�б����д������ʶ��
%--------------------------------------------------------------------------
% CopyRight��xiezhh

%***********************��ȡѵ������ͼƬ��������Ԥ����***********************
% ����uigetfile��������ʽѡȡѵ������ͼƬ
geshi = {'*.jpg','JPEG image (*.jpg)';...
       '*.bmp','Bitmap image (*.bmp)';...
       '*.*','All Files (*.*)'};
[FileName FilePath] = uigetfile(geshi,'ѡȡѵ������ͼƬ',...
    '*.jpg','MultiSelect','on');

if ~isequal([FileName,FilePath],[0,0]);
    FileFullName = strcat(FilePath,FileName);
    if ~iscell(FileName)
        FileName = {FileName};
        FileFullName = {FileFullName};
    end
else
    return;
end
n = length(FileFullName);
I = zeros(50);
BW = zeros(16);
training = zeros(1,256);
group = [];
% ͨ��ѭ����ÿһ��ͼƬ���б�׼������������ѵ���������ݾ���training�ͷ�������group
for i = 1:n
    I = imread(FileFullName{i});
    I = 255-I;   
    I = im2bw(I,0.4);
    [y,x] = find(I == 1);
    BW = I(min(y):max(y),min(x):max(x));
    BW = imresize(BW,[16, 16]);
    training(i,:) = double(BW(:)');
    [pathstr,namestr,ext] = fileparts(FileName{i});
    group = [group;str2num(namestr(4))];
end


%***************************�������ر�Ҷ˹����������*************************
% �������ر�Ҷ˹����������ObjBayes
ObjBayes = NaiveBayes.fit(training,group,'Distribution','mn')


%*****************************��ѵ������ͼƬ�����б�*************************
% ���������������ر�Ҷ˹����������ObjBayes����ѵ������ͼƬ�����б�
pre0 = ObjBayes.predict(training);
isequal(pre0, group)


%***********************��ȡ��������ͼƬ��������Ԥ����***********************
% ����uigetfile��������ʽѡȡ��������ͼƬ
geshi = {'*.jpg','JPEG image (*.jpg)';...
       '*.bmp','Bitmap image (*.bmp)';...
       '*.*','All Files (*.*)'};
[FileName FilePath] = uigetfile(geshi,'ѡȡ��������ͼƬ',...
    '*.jpg','MultiSelect','on');

if ~isequal([FileName,FilePath],[0,0]);
    FileFullName = strcat(FilePath,FileName);
    if ~iscell(FileName)
        FileName = {FileName};
        FileFullName = {FileFullName};
    end
else
    return;
end
n = length(FileFullName);
I = zeros(50);
BW = zeros(16);
sampledata = zeros(1,256);
samplegroup = [];
% ͨ��ѭ����ÿһ��ͼƬ���б�׼�����������ɼ����������ݾ���sampledata�ͷ�������samplegroup
for i = 1:n
    I = imread(FileFullName{i});
    I = 255-I;
    I = im2bw(I,0.4);
    [y,x] = find(I == 1);
    BW = I(min(y):max(y),min(x):max(x));
    BW = imresize(BW,[16, 16]);
    sampledata(i,:) = double(BW(:)');
    [pathstr,namestr,ext] = fileparts(FileName{i});
    samplegroup = [samplegroup; str2num(namestr(4))];
end


%*****************************�Լ�������ͼƬ�����б�*************************
% ���������������ر�Ҷ˹����������ObjBayes���Լ�������ͼƬ�����б�
pre1 = ObjBayes.predict(sampledata);
% �鿴�б���
[samplegroup, pre1]