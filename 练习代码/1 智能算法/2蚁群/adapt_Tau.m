function  new_Tau= adapt_Tau(Tau,Tabu,road_L,m,n)
%������Ϣ��
% Q ��Ϣ������ǿ��ϵ��
%Tabu ��¼����·��
%TauΪ��Ϣ�ؾ���
Q=1;
%% ������Ϣ�ص�����
p=0.2;
Tau=(1-p)*Tau;

%%����µ���Ϣ��
Delta_Tau=zeros(n,n);        %��ʼʱ��Ϣ��Ϊn*n��0����
for i=1:m   %m ��·��
for j=1:(n-1)
    
Delta_Tau(Tabu(i,j),Tabu(i,j+1))=Delta_Tau(Tabu(i,j),Tabu(i,j+1))+Q/road_L(i);          
%�˴�ѭ����·����i��j���ϵ���Ϣ������
end
Delta_Tau(Tabu(i,n),Tabu(i,1))=Delta_Tau(Tabu(i,n),Tabu(i,1))+Q/road_L(i);
%�˴�ѭ��������·���ϵ���Ϣ������
end
new_Tau=Tau+Delta_Tau; %������Ϣ�ػӷ������º����Ϣ��


end

