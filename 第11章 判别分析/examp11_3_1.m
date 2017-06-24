%--------------------------------------------------------------------------
%  examp11.3-1  ����fisheriris.mat�����ݣ����б�Ҷ˹�б�
%--------------------------------------------------------------------------
% CopyRight��xiezhh

%********************************��������***********************************
load fisheriris


%**********************************�鿴����*********************************
head0 = {'Obj', 'x1', 'x2', 'x3', 'x4', 'Class'};
[head0; num2cell([[1:150]', meas]), species]


%*********************************��Ҷ˹�б�********************************
ObjBayes = NaiveBayes.fit(meas, species);
pre0 = ObjBayes.predict(meas);
[CLMat, order] = confusionmat(species, pre0);
[[{'From/To'},order'];order, num2cell(CLMat)]


% �鿴������Ʒ���
gindex1 = grp2idx(pre0);
gindex2 = grp2idx(species);
errid = find(gindex1 ~= gindex2)

% �鿴������Ʒ���������
head1 = {'Obj', 'From', 'To'};
[head1; num2cell(errid), species(errid), pre0(errid)]


% ��δ֪�����Ʒ�����б�
x = [5.8	2.7	1.8	0.73
    5.6	3.1	3.8	1.8
    6.1	2.5	4.7	1.1
    6.1	2.6	5.7	1.9
    5.1	3.1	6.5	0.62
    5.8	3.7	3.9	0.13
    5.7	2.7	1.1	0.12
    6.4	3.2	2.4	1.6
    6.7	3	1.9	1.1
    6.8	3.5	7.9	1
    ];
pre1 = ObjBayes.predict(x)

