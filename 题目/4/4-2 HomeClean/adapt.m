function [ JiQiZhenTi,JiQiRoadTi] = adapt(JiQiZhen,JiQiRoad,Position,HuanJing)
%���»�������̽�⵽����������뵽�þ����У�����¼������·��
%Position Ϊ��ѡ���λ��
x=Position(1);
y=Position(2);
JiQiZhenTi=JiQiZhen;
JiQiRoadTi=JiQiRoad;

JiQiZhenTi(x,y)=3;
%����·��
JiQiRoadTi=[JiQiRoadTi;Position];

%�ж�����,1������ߣ�2�����ϰ���0����û����
u=HuanJing(x-1,y);
d=HuanJing(x+1,y);
l=HuanJing(x,y-1);
r=HuanJing(x,y+1);
JiQiZhenTi(x,y)=3;   %�������ڸõ�
%��������
if JiQiZhenTi(x,y-1)==0
    JiQiZhenTi(x,y-1)=HuanJing(x,y-1);
end
if  JiQiZhenTi(x,y+1)==0
    JiQiZhenTi(x,y+1)=HuanJing(x,y+1);
end
if  JiQiZhenTi(x-1,y)==0
    JiQiZhenTi(x-1,y)=HuanJing(x-1,y);
end
if  JiQiZhenTi(x+1,y)==0
    JiQiZhenTi(x+1,y)=HuanJing(x+1,y);
end
   

end

