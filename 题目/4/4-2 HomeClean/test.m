%%  ������
%clc,clear;
%% 1 �����ĳ�ʼ����ֵ
%BuLength=10;
%JiQiZhen=[];
position=[2,2];  %��ǰλ��
JiQiRoad=[];
JiQiRoad=[JiQiRoad;position];
%JiQiZhen(1,1)=2;JiQiZhen(1,2)=2;JiQiZhen(2,1)=2;
% ���»�����������򣿣���������������������������������ʼ�����·��

%% 2 ���ݻ��������ɣ����뷿�ݳ��Ϳ��ָ��������Լ��ϰ���ĸ���+��Ӧ�ϰ�����ζ��������,
     %������ݻ���ӳ��ľ����ϰ������� 2 ��ʾ
  %HuanJing=createHuanJing();
  HuanJing=Shangyi;
  [m,n]=size(HuanJing);
  JiQiZhen=HuanJing;
  JiQiZhen(2:m-1,2:n-1)=0;
  JiQiZhen(2,2)=3;
  JiQiZhen(3,2)=HuanJing(3,2);JiQiZhen(2,3)=HuanJing(2,3);
%% 3 ����ͨ������̽����Ѱ·������ֹ����Ϊ����Ϊ��
ZhongFlag=panDuanZhong(JiQiZhen);     % input JiQiZhen �� HuanJing �����жϻ��������Ƿ�ȫ������,������1������ 0
oldPosition=position;
while ZhongFlag==1
    [DirectionFlag,newPosition]=findDirection(JiQiZhen,oldPosition);  %�ж��ĸ�������������������Ϊ 1������2������3������4��������0
    %�������ֱ���ߣ�FlagΪ 1 ������flagΪ 0��Ϊ 1 ʱ��������һ�������꣬����Ϊ��
    if DirectionFlag==1   %����position�������ǰ����
        Position=newPosition;
    else 
        %Ѱ�ң�������������·���ߵĲ�������ĵ�,�浽positon
       % Position=selectPosition(JiQiZhen,oldPosition);
        %��¼��oldposition ��Position �� ·�� ����������������������������Ծ·�ߵļ�¼
        [newPosition,TiaoRoads]=dealDeathCorner(JiQiZhen,oldPosition);
        JiQiRoad=[JiQiRoad;TiaoRoads];
        Position=newPosition;
    end
    oldPosition=Position;   %���µ�ǰλ��
    
    %% 4 ���»����������̽�⵽��ΧΪ�ϰ��������뵽�þ����У�����¼������·��
    [JiQiZhenTi,JiQiRoadTi]=adapt(JiQiZhen,JiQiRoad,Position,HuanJing);
    JiQiZhen=JiQiZhenTi;JiQiRoad=JiQiRoadTi;
    %������ֹ����
    ZhongFlag=panDuanZhong(JiQiZhen);  
end