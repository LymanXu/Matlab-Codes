clear,clc;
%% 1 ��ʼ������Ⱥ,����ÿ��������2�ı��������ӵ�ά�Ⱥ��Ǹ��෴
N=input('�����ʼ����Ⱥ�ĸ���');
position(1,:)=4*rand(1,N)-2;   %����λ����Ϣ
position(2,:)=3*rand(1,N)-1.5;
pbest=zeros(2,N);    %����ÿ��������ʷ����λ��
gbest=zeros(2,1);    %����Ⱥ��ʷ����λ��
fvalue=zeros(1,N);   %��¼ÿ��������ʷ���ŵĵ�fitness value
pfvalue=zeros(1,N);%��¼ÿ�����ӵ�ǰ�� fitness value
Vf=rand(2,N);   %��¼ÿ�����ӵ��ٶ�
Vscope=[0.5,-0.5];Pscope=[2,-2];
%����ѭ������������������Ϊ10000
num=1000;
for dI=1:num
    %��ÿ�����Ӽ���fitness value
    %% 2 ��鲢����ÿ�����ӵ���ʷ����λ��pbest
    [fvalue pbest]=fitness(position,pbest,fvalue);
    
    %ѡ������Ⱥ�����ŵ���ʷλ��
    gbest=selectgbest(fvalue,pbest);
    
    %���㲢���¸������ӵĵ�λ�ã����ٶ�
    w=calculateW(dI,num);
    [position Vf]=updatep(position,Vf,pbest,gbest,Vscope,Pscope,w);
    
    disp(['��ǰ����������',num2str(dI)]);
end
%�����һ�ν��и��£���������λ��
 [fvalue pbest]=fitness(position,pbest,fvalue);
 gbest=selectgbest(fvalue,pbest);

disp(['����Xλ���ǣ�',num2str(gbest(1,1))]);
disp(['����Yλ���ǣ�',num2str(gbest(2,1))]);
fvaluebest=max(fvalue);
disp(['���ź���ֵΪ��',num2str(fvaluebest)]);



