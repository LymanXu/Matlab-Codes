clc;close all;
%% 1 ��ʼ������Ⱥ,����ÿ��������2�ı�����������ά���
N=1000;L=2;
%���������N:��Ⱥ��С�ĸ��� %���������L��һ�����ӵ�ά�� 
%���������ParticleScope:һ�������������и�ά�ķ�Χ�� 
%  3ά���ӵ�ParticleScope��ʽ:  [x1Min,x1Max %     x2Min,x2Max % x3Min,x3Max]                                   x3Min,x3Max] % 
%���������AdaptFunc����Ӧ�Ⱥ��� % 
%�����ParSwarm��ʼ��������Ⱥ 
%�����OptSwarm����Ⱥ��ǰ���Ž���ȫ�����Ž�
ParticleScope=[49,-78;16,-132];VScope=[30,30;-30,-30];
[ParSwarm,vf]=InitSwarm(N,L,ParticleScope,VScope);
position=ParSwarm;   %����λ����Ϣ
Vf=vf;   %��¼ÿ�����ӵ��ٶ�
pbest=position;    %����ÿ��������ʷ����λ��
pfvalue=fitness(position);%��¼ÿ�����ӵ�ǰ�� fitness value N*1
fvalue=pfvalue;   %��¼ÿ��������ʷ���ŵĵ�fitness value
maxIndex=find(max(pfvalue)==pfvalue);maxIndex=maxIndex(1);
gbest=position(maxIndex,:);
gbestF=pfvalue(maxIndex,1);
gbest=SelectGbest(pbest,gbest,fvalue,gbestF,ParticleScope);    %����Ⱥ��ʷ����λ��
%gbest=[22,-25];gbestF=[0.9556];
T=[8.9000
    8.9500
    9.0000
    9.0500
    9.1000
    9.1500
    9.2000
    9.2500
    9.3000
    9.3500
    9.4000
    9.4500
    9.5000
    9.5500];

%����ѭ������������������Ϊ10000
num=200;
%��¼ÿ�ε������ڵ���Ӧ��
DieF=zeros(num,1);
for dI=1:num
    
    %% 2 ���㲢���¸������ӵĵ�λ�ã����ٶ�
     w=calculateW(dI,num);
    [position ,Vf]=updatep(position,Vf,pbest,gbest,VScope,ParticleScope,w);
    %% 3 ��������λ�ú�ȫ������
    pfvalue=fitness(position);
    [pbest,fvalue,gbest,gbestF]=updateBest(position,pbest,gbest,pfvalue,fvalue,gbestF,ParticleScope);
    disp(['��ǰ����������',num2str(dI)]);
    DieF(dI,1)=gbestF;
end
%% 4 ������
[~,bestYL]=CalculateYingL(gbest(1,1),gbest(1,2));
plot(DieF);
xlabel('����');ylabel('���ƶ�');
figure
plot(T,bestYL,'r');
hold on
plot(T,TrueYL);
xlabel('ʱ��/Сʱ');ylabel('Ӱ��/��');
legend('ģ��Ӱ��','��ʵӰ��')

disp(['���ŵ�ȫ��������Ӧ�ȣ�',num2str(gbestF)]);
disp(['����ά�� w �ǣ�',num2str(gbest(1,1))]);
disp(['���ž��� j �ǣ�',num2str(gbest(1,2))]);

fvaluebest=max(fvalue);
pindex=find(fvaluebest==fvalue);
pindex=pindex(1);
disp(['���и��������Ÿ�������ź���ֵΪ��',num2str(fvaluebest)]);
disp(['����ά�� w �ǣ�',num2str(position(pindex,1))]);
disp(['���ž��� j �ǣ�',num2str(position(pindex,2))]);
disp('��Ӱ����ֵ');
bestYL./TrueYL
disp('Ӱ����');
bestYL

