%��Ⱥ�㷨
clc
clear all
close all
%% 1 �����Ŵ��㷨����

maxgen=5000;            %��������
num=50;               %��Ⱥ����
pmutation=0.01;        %�������
length=32;             %ÿ������Ļ��򳤶�
avgfitness=[];         %��Ⱥƽ����Ӧ��
bestfitness=[];        %��Ⱥ�����Ӧ��
bestchrom=[];          %���ö���õ�Ⱦɫ��
fitSum=10000*ones(num,1);
%% 2 ��ʼ����Ⱥ
for i=1:num
    chrom(i,:)=randperm(length);
end

%% 3 �ҳ���õĸ���,��¼ÿһ����������ú�ƽ����Ӧ��
for i=1:num
    fitSum(i,1)=fitnesst1(chrom(i,:));
end
[bestfitness,index]=min(fitSum);   %chrom num*length
bestchrom=chrom(index,:);
avgfitness=sum(fitSum)/num;
every_fitness(:,1)=fitSum; 
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
    %������Ӧ��
    for j=1:num
    fitSum(j,1)=fitnesst1(chrom(j,:));
    end

    [newbestfitness,newbestindex]=min(fitSum);
    newbestchrom=chrom(newbestindex,:);
    newavgfitness=sum(fitSum)/num;
    %������һ�ν��������Ⱦɫ��
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