clear,clc;
%% 1 ��ʼ������Ⱥ,����ÿ��������2�ı�����������ά���
N=1000;L=2;
%���������N:��Ⱥ��С�ĸ��� %���������L��һ�����ӵ�ά�� 
%���������ParticleScope:һ�������������и�ά�ķ�Χ�� 
%  3ά���ӵ�ParticleScope��ʽ:  [x1Min,x1Max %     x2Min,x2Max % x3Min,x3Max]                                   x3Min,x3Max] % 
%���������AdaptFunc����Ӧ�Ⱥ��� % 
%�����ParSwarm��ʼ��������Ⱥ 
%�����OptSwarm����Ⱥ��ǰ���Ž���ȫ�����Ž�
ParticleScope=[2,1.5;-2,-1.5];VScope=[1,0.7;-1,-0.7];
[ParSwarm,vf]=InitSwarm(N,L,ParticleScope,VScope);
position=ParSwarm;   %����λ����Ϣ
Vf=vf;   %��¼ÿ�����ӵ��ٶ�
pbest=position;    %����ÿ��������ʷ����λ��
pfvalue=fitness(position);%��¼ÿ�����ӵ�ǰ�� fitness value N*1
fvalue=pfvalue;   %��¼ÿ��������ʷ���ŵĵ�fitness value
maxIndex=find(max(pfvalue)==pfvalue);maxIndex=maxIndex(1);
gbest=position(maxIndex,:);
gbestF=pfvalue(maxIndex,1);
gbest=SelectGbest(pbest,gbest,fvalue,gbestF);    %����Ⱥ��ʷ����λ��




%����ѭ������������������Ϊ10000
num=1;
while (num<1000)
    
    %% 2 ���㲢���¸������ӵĵ�λ�ã����ٶ�
    [position Vf]=updatep(position,Vf,pbest,gbest,ParticleScope,VScope);
    %% 3 ��������λ�ú�ȫ������
    pfvalue=fitness(position);
    [pbest,fvalue,gbest,gbestF]=updateBest(position,pbest,gbest,pfvalue,fvalue,gbestF);
    num=num+1;
    disp(['��ǰ����������',num2str(num)]);
end
%% 4 ������

disp(['����Xλ���ǣ�',num2str(gbest(1,1))]);
disp(['����Yλ���ǣ�',num2str(gbest(1,2))]);
fvaluebest=max(fvalue);
disp(['���ź���ֵΪ��',num2str(fvaluebest)]);



