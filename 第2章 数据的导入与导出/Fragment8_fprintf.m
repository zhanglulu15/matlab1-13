%--------------------------------------------------------------------------
%                    ����fprintf����д���ݵ��ļ�����Ļ
%--------------------------------------------------------------------------
% CopyRight��xiezhh

y = fprintf(1, 'ף������ΰ������й�%d�������տ��֣�����', 60)

x = 10*rand(8,5);
fid = fopen('examp02_01.txt','wt');
% �Ѿ���x��ָ����ʽд���ļ�examp02_01.txt
fprintf(fid,'%-f    %-f    %-f    %-f    %-f    %-f    %-f    %-f\n', x);
fclose(fid);

x = rand(6,5)/10000;
fid = fopen('examp02_02.txt','wt');
% �Ѿ���x��ָ����ʽд���ļ�examp02_02.txt
fprintf(fid,'%-e  %-e  %-e  %-e  %-e  %-e\n', x);
fclose(fid);

x=10*rand(9,4);
fid = fopen('examp02_03.txt','wt');
% �Ѿ���x��ָ����ʽд���ļ�examp02_03.txt
fprintf(fid,'%f,%f,%f,%f,%f,%f,%f,%f,%f\n',x);
fclose(fid);

x = 10*rand(5,4);
fid = fopen('examp02_04.txt','wt');
% �Ѿ���x��ָ����ʽд���ļ�examp02_04.txt
fprintf(fid,'%-f    %-f,    %-f;    %-f*    %-f\n',x);
fclose(fid);

w = 10*rand(1,4);
x = 10*rand(1,3);
y = 10*rand(1,2);
z = 10*rand;
fid = fopen('examp02_05.txt','at');
% ������w,x,y,z�ֱ���ָ����ʽд���ļ�examp02_05.txt
fprintf(fid,'%-f    %-f    %-f    %-f\n', w);
fprintf(fid,'%-f    %-f    %-f\n', x);
fprintf(fid,'%-f    %-f\n', y);
fprintf(fid,'%-f\n', z);
fclose(fid);

x = 10*rand(1,3);
y = 10*rand(1,5);
z = 10*rand(1,4);
fid = fopen('examp02_06.txt','at');
% ������x,y,z�ֱ���ָ����ʽд���ļ�examp02_06.txt
fprintf(fid,'%-f    %-f    %-f\n', x);
fprintf(fid,'%-f    %-f    %-f    %-f    %-f\n', y);
fprintf(fid,'%-f    %-f    %-f    %-f\n', z);
fclose(fid);

x = 10*rand(6,3);
fid = fopen('examp02_07.txt','at');
fprintf(fid,'����%d��ͷ�ļ���\n�����ѡ����������ȡ��������ݡ�\n', 2);
% �Ѿ���x��ָ����ʽд���ļ�examp02_07.txt
fprintf(fid,'%-f,    %-f,    %-f,    %-f,    %-f,    %f\n', x);
fclose(fid);

x = 10*rand(6,3);
y = 10*rand(3,2);
fid = fopen('examp02_08.txt','at');
fprintf(fid,'����%d��ͷ�ļ���\n�����ѡ����������ȡ��������ݡ�\n', 2);
fprintf(fid,'%-f    %-f    %-f    %-f    %-f    %f\n', x);
fprintf(fid,'���ﻹ����������˵�����������ݣ�\n���㻹��û�а취��\n');
% �Ѿ���y��ָ����ʽд���ļ�examp02_08.txt
fprintf(fid,'%-f    %-f    %-f    %-f    %-f    %f\n', y);
fclose(fid);

x = 10*rand(2,12);
fid = fopen('examp02_09.txt','wt');
% �Ѿ���x��ָ����ʽд���ļ�examp02_09.txt
fprintf(fid,'%f+%fi, %f+%fi, %f+%fi, %f+%fi\n', x);
fclose(fid);

dt = [2009 08 19 10 39 56.171
         2009 08 20 10 39 56.171
         2009 08 21 10 39 56.171
         2009 08 22 10 39 56.171]';
fid = fopen('examp02_10.txt','wt');
% �Ѿ���dt��ָ����ʽд���ļ�examp02_10.txt
fprintf(fid,'%d-%d-%d,  %d:%d:%5.3f AM\n', dt);  
fclose(fid);

x = ['xiezh'; 'molih'; 'liaoj'; 'lijun'; 'xiagk'];
y = [18 16 15 20 15]';
z = [170 160 160 175 172]';
w = [65 52 50 70 56]';
fid = fopen('examp02_11.txt','at');
fm = 'Name: %s Age: %d Height: %d Weight: %d kg\n';
% ͨ��ѭ����x,y,z��w��ָ����ʽд���ļ�examp02_11.txt
for i = 1:5    
       fprintf(fid, fm, x(i,:),y(i),z(i),w(i));
   end
fclose(fid);


x = [1 2 3; 4 5 6; 7 8 9; 10 11 12]
% �Ѿ���x��ָ����ʽ��ʾ����Ļ��
fprintf(1, '    %-d    %-d    %-d    %d\n', x);
