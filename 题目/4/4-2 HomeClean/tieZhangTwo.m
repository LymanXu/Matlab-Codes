function [f2flag,tiaoroads,position ] = tieZhangTwo(jiTi,oldP,L,row,col )
%���Ϸ��� 2
TiaoRoads=[];
%������ ��  ��  ��
[m,n]=size(jiTi);
oldp=oldP;
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

%����̽�� �� �� �� �� 
Flag=0;
while Flag==0  %��ֹ����Ϊ 1
    [diFlag,newP]=tiaoFindDir2(JiTi,oldp);  %diFlag ��ʾ�õ��Ƿ��г�·������Ϊ 1������Ϊ0
     if diFlag~=-1   %���Լ���̽�⣬1--��λ���г�· 0--��λ��û��·�����Լ���̽��
    TiaoRoads=[TiaoRoads;newP];
    JiTi(newP(1,1),newP(1,2))=3; %��ʾ�߹���
    oldp=newP;
    Flag=diFlag;
    else  %���Ϸ���2 �Ѵﵽ��·����
        Flag=-1;
        newP=[];TiaoRoads=[];
        break;
     end
end
f2flag=Flag;
tiaoroads=TiaoRoads;
position=newP;


end

function [diflag,newp]=tiaoFindDir2(JiTi,oldp)
%̽�����һҪ�ߵĵ㣬���жϸõ��Ƿ��г�·
%% %������ ��  ��  ��
%�ڶ������ȷ��� �� �� ���ϣ��������ķ����ֵ������Ϊ 3
%% �����ߵģ��ڻ����� 4 ��ʾ���߹�����3 ���ϰ���2
x=oldp(1);
y=oldp(2);  %�����е�λ��
if JiTi(x+1,y)==4
   %�±߿�����
   p=[x+1,y];
   tflag=haveRoads2(JiTi,p);
elseif JiTi(x,y-1)==4 %��
    p=[x,y-1];
    tflag=haveRoads2(JiTi,p);
elseif JiTi(x,y+1)==4%��
    p=[x,y+1];
     tflag=haveRoads2(JiTi,p);
elseif  JiTi(x-1,y)==4%��
    p=[x-1,y];
     tflag=haveRoads2(JiTi,p);
else
    tflag=-1;   %û�� 4 �Ļ��ˣ��޷�����̽��
    p=[];
  disp('���������γɵ��ڻ�û����ͨ��˵����ʱ���������');
end

diflag=tflag;
newp=p;

end

function  f=haveRoads2(JiTwo,p)
%�жϸ�λ�õķ����Ƿ��г�·
%�з���1 �����򷵻� 0
x=p(1,1);y=p(1,2);
if JiTwo(x-1,y)==1 %���߹�
       f=1;
elseif JiTwo(x+1,y)==1
    f=1;
elseif JiTwo(x,y-1)==1
    f=1;
elseif JiTwo(x,y+1)==1
    f=1;
else
    f=0;
end


end















