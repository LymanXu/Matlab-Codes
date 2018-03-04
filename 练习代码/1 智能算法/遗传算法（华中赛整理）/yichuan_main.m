clc
clear all;
tic
%%
maxgen=50;            %��������
num=50;               %��Ⱥ����
pmutation=0.01;        %�������
length=18;             %ÿ������Ļ��򳤶�
avgfitness=[];         %��Ⱥƽ����Ӧ��
bestfitness=[];        %��Ⱥ�����Ӧ��
bestchrom=[];          %���ö���õ�Ⱦɫ��


%% ��ʼ����Ⱥ
chrom=get_chrom(num,length);

%% �ҳ���õĸ���,��¼ÿһ����������ú�ƽ����Ӧ��
[bestfitness,index]=max(fitness(chrom));
bestchrom=chrom(index,:);
avgfitness=sum(fitness(chrom))/num;
every_fitness(:,1)=fitness(chrom);
trance=zeros(maxgen,2);
old_chrom=chrom;
%% ������ʼ
for i=1:maxgen
    %����
    chrom=chiasma(chrom);
    %����
    chrom=Mutation(chrom,pmutation);
    %����Ӧ�Ȳ��ҵ�����Ⱦɫ�弰��λ��
%     fitness=zeros(num,1);
    [newbestfitness,newbestindex]=max(fitness(chrom));
    newbestchrom=chrom(newbestindex,:);
    newavgfitness=sum(fitness(chrom))/num;
    %������һ�ν��������Ⱦɫ��
    if newbestfitness>bestfitness
        bestfitness=newbestfitness;
        bestchrom=newbestchrom;
    end
    every_fitness(:,i+1)=fitness(chrom);
    trance(i,:)=[newbestfitness newavgfitness];%��ÿ�ν����������Ӧ�Ⱥ�ƽ��
    %ѡ��
    chrom=select(old_chrom,chrom,every_fitness(:,i:i+1));
    
    old_chrom=chrom;
    disp(['��',num2str(i),'��']);
    bestchrom
end
bestfitness
bestchrom
toc
    