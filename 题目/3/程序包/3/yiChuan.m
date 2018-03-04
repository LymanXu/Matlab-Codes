
clc
clear all
close all
%% 1 �����Ŵ��㷨����
 
maxgen=100;            %��������
num=50;               %��Ⱥ����
pmutation=0.01;        %�������
length=4;             %ÿ������Ļ��򳤶�
avgfitness=[];         %��Ⱥƽ����Ӧ��
bestfitness=[];        %��Ⱥ�����Ӧ��
bestchrom=[];          %���ö���õ�Ⱦɫ��
fitSum=10000*ones(num,1);
Height=[10,20;20,20;30,40;5,15];

%% 2 ��ʼ����Ⱥ
for i=1:num
    for j=1:length
        chrom(i,j)=rand()*Height(j,2)+Height(j,1);
    end
end

%% 3 �ҳ���õĸ���,��¼ÿһ����������ú�ƽ����Ӧ��
for i=1:num
    fitSum(i,1)=fitness(chrom(i,:));
end
[bestfitness,index]=min(fitSum);   %chrom num*length
bestchrom=chrom(index,:);
avgfitness=sum(fitSum)/num;
every_fitness(:,1)=fitSum; 
trance=zeros(maxgen,2);
old_chrom=chrom;

%% ������ʼ
for i=1:maxgen
    disp(['�� ',num2str(i),' �ε���']);
    %����
    chrom=chiasma(chrom);
    %����
    chrom=Mutation(chrom,pmutation,Height);
    %����Ӧ�Ȳ��ҵ�����Ⱦɫ�弰��λ��
%     fitness=zeros(num,1);
    %������Ӧ��
    for j=1:num
    fitSum(j,1)=fitness(chrom(j,:));
    end

    [newbestfitness,newbestindex]=min(fitSum);  %��������������
    newbestchrom=chrom(newbestindex,:);
    newavgfitness=sum(fitSum)/num;
    %������һ�ν��������Ⱦɫ��  ?????
    if newbestfitness<bestfitness
        bestfitness=newbestfitness;
        bestchrom=newbestchrom;
    end
    every_fitness(:,i+1)=fitSum;
    trance(i,:)=[newbestfitness newavgfitness];%��ÿ�ν����������Ӧ�Ⱥ�ƽ��
    %ѡ��
    chrom=select(old_chrom,chrom,every_fitness(:,i:i+1));
    
    old_chrom=chrom;
    disp(['��',num2str(i),'��']);
    bestchrom
end