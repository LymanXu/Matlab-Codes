function [RSR,RSort] = calculateRSR( R)
%�����Ⱥͱȡ�RSR
[m,n]=size(R);

RSR=zeros(m,1);
%����RSR
for i=1:m
 RSR(i,1)=sum(R(i,:))/(m*n);
end

%������
Rt=RSR;
num=1;
while num<=m  %��֤RSR �е�Ԫ��ȫ������
    index=find(Rt==max(Rt));
    %index ���ܰ������
    inl=length(index);
    for j=1:inl
        rsx=index(j);
        RSort(rsx)=num;
        disp(['��',num2str(rsx),'��� ռ�� ',num2str(num),' ����'])
        Rt(rsx)=-inf;
    end
    num=num+inl;
   
        

end

