%% 1
%���� �ִ���һ��A ҽҩ��ľ������
Ad=input('����A���ĺ͸������� ֮��(n+1,n+1)�ľ���d:');
%% 2  �����Լֵ S
[m,n]=size(Ad);
S=zeros(n,n);
%���� ������ xuQiu ��
xuQiu=zeros(1,(n-1));
xuQiu=input('���������������������');
%for k=1:n

for i=2:n  %���� n ��   ע�⣡�������������Ǿ���Cm^2��
    for j=(i+1):n 
           S(i,j)=Ad(1,i)+Ad(1,j)-Ad(i,j);
end
end

%% ������S�е�Ԫ��Sij �Ӵ�С��������
JieYueN=n-1;
JieYueSum=JieYueN*(JieYueN-1)/2; %��Ҫ����ĸ���
%�洢 S ������
Spai=zeros(JieYueSum,2);

for i=1:JieYueSum   %�˴������Ͻ���������
    S==max(max(S)); %��ʱS ��Լ�����ֵ��
    [indexh,indexl]=find(S==max(max(S)));
    Spai(i,1)=indexh;Spai(i,2)=indexl;
    S(indexh,indexl)=0;
end
%% 4 �ź���ý��� ��Ҫѭ�� ���� Spai =�գ�������������ж�����Ԫ���Ƿ�����һ����������

% �ж�Spai������ Ԫ���Ƿ�ȥ����  ��ȥ���� �򷵻� 0 
RunOr=panDuanKong(Spai);
besti=Spai(1,1);bestj=Spai(1,2);
while RunOr==1
   %�Ƿ����������������� ,��ת���� ��5��
   ManFlag=manZuThree(); %���㣬��Ϊ 1��ת��5��������Ϊ 0 ��ת��8��
      if ManFlag==1
       % ת ��5��
       else
        %ת ��8��
       end
%% 5 ���� i j ���������� besti bestj
    Wsum=xuQiu(besti)+xuQiu(bestj);
   % Wsum >���� �����������ط�    <���� �������ж��Ƿ���� ��һ���ط�
   %jiXiuFlag  Ϊ 2 �������� 1 ����1�� 0����0��
   jiXiuFlag=panDuanJiXiu(Wsum,xiuQiu);
   if jiXiuFlag==2
        % 
     elseif jiXiuFlag==1
      %
     else  %1 ��Ҳ������ԭ��ҩ��
       %
     end


RunOr=panDuanKong(Spai);
end

if RunOr==0  %Spai Ϊ��ʱ
disp('�㷨����');
end
%����























