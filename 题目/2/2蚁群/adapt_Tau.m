function  new_Tau= adapt_Tau(Tau,Tabu,road_L,m,n,PathTiao)
%������Ϣ��,   ���� PathTiao ��������Ӱ��ܴ�
% Q ��Ϣ������ǿ��ϵ��
%Tabu ��¼����·��
%TauΪ��Ϣ�ؾ���
Q=10;
P=10;
%Tmax=1000;

%% ������Ϣ�ص�����
p=0.3;
Tau=(1-p)*Tau;

%%����µ���Ϣ��
Delta_Tau=zeros(n,n);        %��ʼʱ��Ϣ��Ϊn*n��0����
for i=1:m   %m ��������·��
for j=1:(n-1)
    
Delta_Tau(Tabu(i,j),Tabu(i,j+1))=Delta_Tau(Tabu(i,j),Tabu(i,j+1))+Q/road_L(i)+P/PathTiao(i,1);          
%�˴�ѭ����·����i��j���ϵ���Ϣ������
end
Delta_Tau(Tabu(i,n),Tabu(i,1))=Delta_Tau(Tabu(i,n),Tabu(i,1))+Q/road_L(i)+P/PathTiao(i,1);
%�˴�ѭ��������·���ϵ���Ϣ������
end
new_Tau=Tau+Delta_Tau; %������Ϣ�ػӷ������º����Ϣ��

%���������С�ۼ�Ũ�ȵ����ƣ�ʹ�㷨��ɢ������ȫ�ֽ�


end

