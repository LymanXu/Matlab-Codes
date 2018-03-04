%% ������
clear
clc
close all
X=rand(80,2).*100;  %������ɳ�������
NIND=100; %��Ⱥ��С
MAXGEN=200;
Pc=0.9; %�������
Pm=0.05; %�������
GGAP=0.9; %����
D=Distance(X); %���ɾ������
N=size(D,1);
%% 1 ��ʼ����Ⱥ
Chrom=InitPop(NIND,N);
%������ʼ·��ͼ
DRang=[30,110]
DrawPath(Chrom(1,:),X);
pause(0.0001)
%�����ʼ·�ߺ��ܾ���
disp('��ʼ��Ⱥ�е�һ�����ֵ��')
OutputPath(Chrom(1,:));
Rlength=PathLength(D,Chrom(1,:));
disp(['�ܾ��룺',num2str(Rlength)]);
disp('---------------------------------------------------------------------');

%% 2 �����Ż�
gen=0;
figure;
hold on;box on
xlim([0,MAXGEN])
xlabel('����')
ylabel('����ֵ')
ObjV=PathLength(D,Chrom);  %����·�߳���
preObjV=min(ObjV);
while gen<MAXGEN
    %������Ӧ��
    ObjV=PathLength(D,Chrom);
    line([gen-1,gen],[preObjV,min(ObjV)]);pause(0.0001)
    preObjV=min(ObjV);
    FitnV=Fitness(ObjV);
    %% 2-1 ѡ��  ��·��Խ������Ӧ��FitnVԽС��
    SelCh=Select(Chrom,FitnV,GGAP);
    %% 2-2 ����
    SelCh=Recombin(SelCh,Pc);
    %% 2-3 ����
    SelCh=Mutate(SelCh,Pm);
    %% 2-4 ��ת
    SelCh=Reverse(SelCh,D);
    %% 2-5 �ز����Ӵ�������Ⱥ
    Chrom=Reins(Chrom,SelCh,ObjV);
    %���µ�������
    gen=gen+1;
    disp(['�� ',num2str(gen),' ��']);
end
%% 3 �������Ž�·��ͼ
ObjV=PathLength(D,Chrom);
[minObjV,minInd]=min(ObjV);
DrawPath(Chrom(minInd(1),:),X);
%������Ž�·�ߺ��ܾ���
disp('���Ž⣺')
p=OutputPath(Chrom(minInd(1),:));
disp(['�ܾ��룺',num2str(ObjV(minInd(1)))]);














    
    
    
    
    
    
    
    
    
    
    
    
    




















