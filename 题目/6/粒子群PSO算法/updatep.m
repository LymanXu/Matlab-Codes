function [position V] = updatep(position,Vf,pbest,gbest)
%����ÿ�����ӵ�λ��

%�Ȼ����ϴ�λ�ã�ͼ��
%hold on
%plot3(position(1,:),position(2,:),pfvalue)

%�����ٶ�
%x����
V(1,:)=Vf(1,:)+2*rand()*(pbest(1,:)-position(1,:))+2*rand()*(gbest(1,1)-position(1,:));
V(2,:)=Vf(2,:)+2*rand()*(pbest(2,:)-position(2,:))+2*rand()*(gbest(2,1)-position(2,:));

V(3,:)=Vf(3,:)+2*rand()*(pbest(3,:)-position(3,:))+2*rand()*(gbest(3,1)-position(3,:));
V(4,:)=Vf(4,:)+2*rand()*(pbest(4,:)-position(4,:))+2*rand()*(gbest(4,1)-position(4,:));

%����ÿ�����ӵ�λ��
position(1,:)=position(1,:)+V(1,:);
position(2,:)=position(2,:)+V(2,:);

position(3,:)=position(3,:)+V(3,:);
position(4,:)=position(4,:)+V(4,:);

end

