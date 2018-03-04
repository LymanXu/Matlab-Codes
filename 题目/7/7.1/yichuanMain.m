clc,clear;
%% 1 ��ʼ������
maxgen=10000;
sizepop=20;     %��Ⱥ��ģ
pcross=[0.6];   %�������
pmutation=[0.01]; %�������
%lenchrom=[1 1 1 1];  %ÿ���������ַ������ȣ�����Ǹ���������򳤶ȶ�Ϊ1
lenchrom=64;
%��Ⱦɫ����б��룬������4 �Ҵ���ʼ���ĸ��� 1 8 57 64

%% 2 �����ʼ�� 
individuals=struct('fitness',zeros(1,sizepop),'chrom',[]);  %��Ⱥ�ṹ��
avgfitness=[];     %��Ⱥƽ����Ӧ��
bestfitness=[];    %��Ⱥ�����Ӧ�� 
bestchrom=[];      %��Ӧ����õ�Ⱦɫ��

%��ʼ����Ⱥ
%������������������� 64*64
[ZuoBiao,D]=createD();
for i=1:sizepop
    %�������һ����Ⱥ
    individuals.chrom(i,:)=Code(lenchrom);  %�������Ⱦɫ��
    x=individuals.chrom(i,:);
    individuals.fitness(i)=fitness(x,D);
end

%�ҵ���õ�Ⱦɫ��
[bestfitness ,bestindex]=min(individuals.fitness);   
bestchrom=individuals.chrom(bestindex,:);   %�ҵ���õ�Ⱦɫ��
avgfitness=sum(individuals.fitness)/sizepop;   %Ⱦɫ���ƽ������Ӧ��

%��¼ÿ�������е���õ���Ӧ�Ⱥ�ƽ����Ӧ��
trace=[];

%% 3 ������ʼ
for i=1:maxgen
    disp(['�� ',num2str(i),' �ν���']);
    %ѡ��
    individuals=Select(individuals,sizepop);
    avgfitness=sum(individuals.fitness)/sizepop;
    %����
    individuals.chrom=Cross(pcross,lenchrom,individuals.chrom,sizepop);
    %����
   % pop=[i,maxgen];
    %individuals.chrom=Mutation(pmutation,lenchrom,individuals.chrom,sizepop,[i maxgen],bound);
    individuals.chrom=Mutation(pmutation,lenchrom,individuals.chrom,sizepop);
    %������Ӧ��
    for j=1:sizepop
        %Ⱦɫ���һ��
        oneChrom=individuals.chrom(j,:);
        first=oneChrom(1,1);
        index=find(oneChrom==1);
        oneChrom(1,1)=1;
        oneChrom(1,index)=first;
        individuals.chrom(j,:)=oneChrom;
       
        individuals.fitness(j)=fitness(oneChrom,D);
    end
    %�ҵ�����Ⱦɫ�� ����������Ⱥ�е�λ��
    [newbestfitness,newbestindex]=min(individuals.fitness);
    %������һ�ν�������õ�Ⱦɫ��
    if bestfitness>newbestfitness
        bestfitness=newbestfitness;
        bestchrom=individuals.chrom(newbestindex,:);
    end
    avgfitness=sum(individuals.fitness)/sizepop;  
    trace=[trace;avgfitness bestfitness];    %��¼ÿһ����������õ���Ӧ�Ⱥ�ƽ����Ӧ��
    disp(['����֮ǰ���ŵĸ���Ϊ��',num2str(bestchrom)]);
    disp(['����֮ǰ��������Ӧ��Ϊ��',num2str(bestfitness)]);
end  %��������