%--------------------------------------------------------------------------
%                    ����load������ȡ�ļ��е�����
%--------------------------------------------------------------------------
% CopyRight��xiezhh

load examp02_01.txt
load  -ascii  examp02_01.txt
x1 = load('examp02_02.txt')

x1 = load('examp02_02.txt', '-ascii');

x2 = dlmread('examp02_01.txt');

x3 = textread('examp02_01.txt');
load examp02_03.txt
load examp02_04.txt

% ��load���������ļ�examp02_05.txt�е����ݣ����ִ���
load examp02_05.txt

% ��load���������ļ�examp02_07.txt�е����ݣ����ִ���
load examp02_07.txt

% ��load���������ļ�examp02_10.txt�е����ݣ����ִ���
load examp02_10.txt

% ��load���������ļ�examp02_11.txt�е����ݣ����ִ���
load examp02_11.txt

% ��load���������ļ�examp02_12.txt�е�����
x = load('examp02_12.txt')