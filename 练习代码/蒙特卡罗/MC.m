staus=10;
for i=1:4 %4��ģ�⣬��x[0~1] y[0~1]�ķ�Χ��
    point=staus.^i;%ģ����������
    RandData=rand(2,point); %��������������������ɢ�㣨x,y��
    Below=find(RandData(1,:).^2>RandData(2,:)); %Ѱ���������·��ĵ�
    BelowData=RandData(:,Below);
    subplot(2,2,i)
    plot(BelowData(1,:),BelowData(2,:),'o')
    OutCome(i)=length(Below)/point; %���ս��
end
