function [DirectionFlag,position] = findDirection(Jiqizhen,oldposition )
%%�ж��ĸ�������������������Ϊ 1������2������3������4��������0
%�������ֱ���ߣ�FlagΪ 1 ������flagΪ 0��Ϊ 1 ʱ��������һ�������꣬����Ϊ��

%% �����ߵ��� 1 ��ʾ���߹�����3 ���ϰ���2
x=oldposition(1);
y=oldposition(2);  %�����е�λ��
if Jiqizhen(x,y-1)==1
   %��߿�����
   p=[x,y-1];
   flag=1;
elseif Jiqizhen(x-1,y)==1
    p=[x-1,y];
    flag=1;
elseif Jiqizhen(x+1,y)==1
    p=[x+1,y];
    flag=1;
elseif  Jiqizhen(x,y+1)==1
    p=[x,y+1];
    flag=1;
else
    flag=0;
    p=[];
end

DirectionFlag=flag;
position=p;
   

end

