%--------------------------------------------------------------------------
%  examp8.1-1  调用anova1函数作单因素一元方差分析
%--------------------------------------------------------------------------
% CopyRight：xiezhh

%********************************读取数据***********************************
[x,y] = xlsread('examp8_1_1.xls');
score = x(:,2);
college = y(2:end,4);
college_id = x(:,1);


%******************************正态性检验***********************************
for i = 1:6
       scorei = score(college_id == i);
       [h,p] = lillietest(scorei);
       result(i,:) = p;
   end
result


%*****************************方差齐性检验**********************************
[p,stats] = vartestn(score,college)


%*******************************方差分析************************************
[p,table,stats] = anova1(score,college)


%*******************************多重比较************************************
[c,m,h,gnames] = multcompare(stats);
head = {'组序号','组序号','置信下限','组均值差','置信上限'};
[head; num2cell(c)]
[gnames num2cell(m)]
