function [newPosition,Roads] = dealDeathCorner( JiQiZhen,oldposition)
%���ݻ������� �е� 2�������ڲ�Ԫ��Ϊ 4 �Ļ������ش��˶�
[row,col]=find(JiQiZhen==2);
[m,n]=size(JiQiZhen);
JiTi=JiQiZhen;
JiTi2=JiQiZhen;
L=length(row);

oldP=oldposition;
PositionOne=[];
PositionTwo=[];
TiaoRoads=[];
TiaoRoads1=[];
TiaoRoads2=[];
%%  1  ��һ�������߷�������·�ߣ����µ��г�·�ĵ㣬û�ҵ��� fang1Flag=0
% ̽�� 4 �������ϣ����� ��
[f1flag,TiaoRoads,position]=tieZhangOne(JiTi,oldP,L,row,col);
oneFlag=f1flag;
TiaoRoads1=TiaoRoads;
PositionOne=position;

%% 2 �ڶ���̽�ⷽ��  ̽�� 4 �������£��������ң�����
[f2flag,TiaoRoads,position]=tieZhangTwo(JiTi,oldP,L,row,col);
twoFlag=f2flag;
TiaoRoads2=TiaoRoads;
PositionTwo=position;    %����flag ȡֵֻ����Ϊ -1 �� 1

if oneFlag==-1 && twoFlag==-1   %���ַ���������
    Roads=[];
    newPosition=[];
    disp('�����ѱ������㷨����');
elseif oneFlag==1 &&twoFlag==-1
    Roads=TiaoRoads1;
    newPosition=PositionOne;
elseif oneFlag==-1 && twoFlag==1
     Roads=TiaoRoads2;
    newPosition=PositionTwo;
else
    L1=length(TiaoRoads1);
    L2=length(TiaoRoads2);
    %ѡ��·�߶̵�����
    if L1<L2   %ѡ�񷽰�һ��
         Roads=TiaoRoads1;
          newPosition=PositionOne;
    else
         Roads=TiaoRoads2;
        newPosition=PositionTwo;
    end
    
end
    

end

