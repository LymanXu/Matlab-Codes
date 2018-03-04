function f = fitness(x,D)
%��Ⱦɫ����б�����λ��Ϊ 1��������4 �Ҵ���ʼ���ĸ��� 1 37 1333  1369
%fitness ԽСԽ��

speed=2;
index=zeros(1,4);
index(1)=1;
index(2)=find(x==37);
index(3)=find(x==1333);
index(4)=find(x==1369);
%4 �����������Ϊ 4 ����
sIndex=sort(index);
Time=zeros(4,1);

for i=1:4 %ÿ��ѭ������һֻ����ʱ��
    IChrom=[];
   if i==4
       nEnd=1369+1;
   else
       nEnd=sIndex(i+1);
   end
   
   iLength=nEnd-sIndex(i)-1;
   if iLength>0  %�������� ֮�����Ҫ������ʱ���������ʱ��
       IChrom=x(1,sIndex(i):(nEnd-1));
       ITime=calculateTime(IChrom,D,speed);
       Time(i,1)=ITime;
   else
       Time(i,1)=0;
   end
end
f=max(Time);

end

