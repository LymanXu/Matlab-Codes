function [ ParSwarm,vf] = InitSwarm( N,L,Pscope,Vscope )
%��ʼ������Ⱥ ����λ�� ������������ʷ���š�ȫ�����š�f����������Ӧ�ȡ�pf���ӵ�ǰ��Ӧ��
%vf �����ٶ� 
%���� NȺ��С  L���峤�� Pscope����ÿά�ȵķ�Χ 2*L ��2��Ϊ����   Vscope�ٶȷ�Χ
ParSwarm=rand(N,L);
vf=rand(N,L);
for j=1:L
    ParSwarm(:,j)=ParSwarm(:,j)*(Pscope(1,j)-Pscope(2,j))+Pscope(2,j);
    %��ʼ���ٶ�
    vf(:,j)=vf(:,j)*(Vscope(1,j)-Vscope(2,j))+Vscope(2,j);
end




end

