%--------------------------------------------------------------------------
%  exampA.5-1  基于主成分分析的图像压缩与重建
%--------------------------------------------------------------------------
% CopyRight：xiezhh

%***************调用自编的ImCompressPrin函数进行图像压缩与重建***************
I = ImCompressPrin('football.jpg',1/100);  % 压缩比为100时的重建图像
I = ImCompressPrin('football.jpg',1/20);   % 压缩比为20时的重建图像
I = ImCompressPrin('football.jpg',1/5);    % 压缩比为5时的重建图像
I = ImCompressPrin('football.jpg',1/2);    % 压缩比为2时的重建图像
