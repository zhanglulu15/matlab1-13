function y = mainfun(x)
% ͨ��Ƕ�׺����ķ�ʽ��д����
% CopyRight��xiezhh

y = subfun1(x) + subfun2(x);
    % �Ӻ���1
    function y1 = subfun1(x1)
        y1 = (x1 + 1)^2;
    end
    % �Ӻ���2
    function y2 = subfun2(x2)
        y2 = exp(x2);
    end
y = subfun3(y);
end
%%------------------------------------------
%%�Ӻ���3
%%------------------------------------------
function y = subfun3(x)
y = sqrt(x) - 1;
end