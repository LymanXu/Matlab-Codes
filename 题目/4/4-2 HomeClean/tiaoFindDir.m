function [diFlag,newP] = tiaoFindDir(JiTi,oldP)
%̽�����һҪ�ߵĵ㣬���жϸõ��Ƿ��г�·
%% ��һ�����ȷ��� ���� ���ң���  
%�ڶ������ȷ��� �� �� ���ϣ��������ķ����ֵ������Ϊ 3

%% �����ߵģ��ڻ����� 4 ��ʾ���߹�����3 ���ϰ���2
x=oldP(1);
y=oldP(2);  %�����е�λ��
if JiTi(x-1,y)==4
   %�ϱ߿�����
   p=[x-1,y];
   tflag=haveRoads(JiTi,p);
elseif JiTi(x,y-1)==4 %��
    p=[x,y-1];
    tflag=haveRoads(JiTi,p);
elseif JiTi(x,y+1)==4%��
    p=[x,y+1];
     tflag=haveRoads(JiTi,p);
elseif  JiTi(x+1,y)==4%��
    p=[x+1,y];
     tflag=haveRoads(JiTi,p);
else
    tflag=-1;   %û�� 4 �Ļ��ˣ��޷�����̽��
    p=[];
  disp('���������γɵ��ڻ�û����ͨ��˵����ʱ���������');
end

diFlag=tflag;
newP=p;

end

function  f=haveRoads(JiTwo,p)
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
