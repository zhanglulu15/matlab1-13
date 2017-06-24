function TextHandle = rotateticklabel(ha,tag,rot)

%   ��ת������̶ȱ�ǩ�ĺ���
%   ha   ����ϵ�����Ĭ��Ϊ��ǰ����ϵ��
%   tag  �������ʶ�ַ���('X'��'Y')��Ĭ����תX���ǩ
%   rot  ��ת�Ƕȣ���λ���ȣ�
%
%   Example:
%   x = 0:0.05:2*pi;
%   y = sin(x);
%   plot(x,y);
%   str = '������0|������1|������2|������3|������4|������5|������6|������7';
%   set(gca,'xtick',0:7,'xticklabel',str);
%
%   rotateticklabel(gca,'x',-30);
%
%   CopyRight��xiezhh��л�л���

if ~ishandle(ha)
    warning('��һ���������ӦΪ����ϵ���');
    return;
end

if ~strcmpi(get(ha,'type'),'axes')
    warning('��һ���������ӦΪ����ϵ���');
    return;
end

if nargin == 1
    tag = 'X';
    rot = 0;
elseif nargin == 2
    if isnumeric(tag) && isscalar(tag)
        rot = tag;
        tag = 'X';
    elseif ischar(tag) && (strncmpi(tag,'x',1) || strncmpi(tag,'y',1))
        rot = 0;
    else
        warning('����������ʹ���');
        return;
    end
else
    if ~isnumeric(rot) || ~isscalar(rot)
        warning('����������ʹ���');
    end
    if ~ischar(tag) || (~strncmpi(tag,'x',1) && ~strncmpi(tag,'y',1))
        warning('����������ʹ���');
    end
end

oldxticklabel = findobj('type','text','tag','oldxticklabel');
oldyticklabel = findobj('type','text','tag','oldyticklabel');
if strncmpi(tag,'x',1)
    if isempty(oldxticklabel)
        str = get(ha,'XTickLabel');
        x = get(ha,'XTick');
        yl = ylim(ha);
        set(ha,'XTickLabel',[]);
        y = zeros(size(x)) + yl(1) - range(yl)/70;
        TextHandle = text(x,y,str,'rotation',rot,...
            'Interpreter','none','tag','oldxticklabel');
    else
        set(oldxticklabel,'rotation',rot);
        TextHandle = oldxticklabel;
    end
else
    if isempty(oldyticklabel)
        str = get(ha,'YTickLabel');
        y = get(ha,'YTick');
        xl = xlim(ha);
        set(ha,'YTickLabel',[]);
        x = zeros(size(y)) + xl(1) - range(xl)/10;
        TextHandle = text(x,y,str,'rotation',rot,...
            'Interpreter','none','tag','oldyticklabel');
    else
        set(oldyticklabel,'rotation',rot);
        TextHandle = oldyticklabel;
    end
end

rot = mod(rot,360);
if rot>=0 && rot<180
   set(TextHandle,'HorizontalAlignment','right');
else
   set(TextHandle,'HorizontalAlignment','left');
end