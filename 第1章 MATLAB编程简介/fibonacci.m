%% examp1.6-6
function  y = fibonacci(n)
% ����쳲��������еĵ�n��
%   Copyright xiezhh

if (n < 0) | (round(n) ~= n) | ~isscalar(n)
    warning('�������ӦΪ�Ǹ���������');
    y = [];
    return;
elseif n < 2
    y = n;
else
    y = fibonacci(n-2)+fibonacci(n-1);
end