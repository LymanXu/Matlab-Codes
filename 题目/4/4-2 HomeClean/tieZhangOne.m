function [f1flag,tiaoroads,position] = tieZhangOne( jiTi,oldP,L,row,col)
%���Ϻ���1 ��
TiaoRoads=[];
[m,n]=size(jiTi);
JiTi=jiTi;
for i=1:L  %ÿ��ѭ������һ��Ԫ��Ϊ2 ������,��ʱ�԰˷�λ
    x=row(i);y=col(i);
    if (x-1>1&&x-1<m) && (y>1&&y<n) && (JiTi(x-1,y)==3)  %���߹�
        JiTi(x-1,y)=4;  
    end
     if (x+1>1&&x+1<m) && (y>1&&y<n) && (JiTi(x+1,y)==3)  %���߹�
        JiTi(x+1,y)=4;  
     end
      if (x>1&&x<m) && (y-1>1&&y-1<n) && (JiTi(x,y-1)==3)  %���߹�
        JiTi(x,y-1)=4;  
      end
     if (x>1&&x<m) && (y+1>1&&y+1<n) && (JiTi(x,y+1)==3)  %���߹�
        JiTi(x,y+1)=4;  
     end
     %����
      if (x-1>1&&x-1<m) && (y-1>1&&y-1<n) && (JiTi(x-1,y-1)==3)  %���߹�
        JiTi(x-1,y-1)=4;  
      end
      %����
        if (x-1>1&&x-1<m) && (y+1>1&&y+1<n) && (JiTi(x-1,y+1)==3)  %���߹�
        JiTi(x-1,y+1)=4;  
        end
    %����
      if (x+1>1&&x+1<m) && (y-1>1&&y-1<n) && (JiTi(x+1,y-1)==3)  %���߹�
        JiTi(x+1,y-1)=4;  
      end
    %����
      if (x+1>1&&x+1<m) && (y+1>1&&y+1<n) && (JiTi(x+1,y+1)==3)  %���߹�
        JiTi(x+1,y+1)=4;  
    end
    
end
% ̽�� 4 �������ϣ����� ��
Flag=0;
oldp=oldP;
while Flag==0  %��ֹ����Ϊ 1
    [diFlag,newP]=tiaoFindDir(JiTi,oldp);  %diFlag ��ʾ�õ��Ƿ��г�·������Ϊ 1������Ϊ0
    if diFlag~=-1    %���Լ���̽�⣬1--��λ���г�· 0--��λ��û��·�����Լ���̽��
    TiaoRoads=[TiaoRoads;newP];
    JiTi(newP(1,1),newP(1,2))=3; %��ʾ�߹���
    oldp=newP;
    Flag=diFlag;
    else  %���Ϸ���1 �Ѵﵽ��·����
        Flag=-1;
        newP=[];TiaoRoads=[];
        break;
    end
end

f1flag=Flag;
position=newP;
tiaoroads=TiaoRoads;


end

