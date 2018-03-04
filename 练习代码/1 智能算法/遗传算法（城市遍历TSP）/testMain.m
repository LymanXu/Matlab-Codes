%% ������
clear
clc
close all
X=[ 16,96
    16,94
    20,92
    22,93
    25,97
    22,96
    20,97
    17,96
    16,97
    14,98
    16,97
    21,95
    19,97
    20,92];  %��������
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
DrawPath(Chrom(1,:),X,DRang);
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
DrawPath(Chrom(minInd(1),:),X,DRang);
%������Ž�·�ߺ��ܾ���
disp('���Ž⣺')
p=OutputPath(Chrom(minInd(1),:));
disp(['�ܾ��룺',num2str(ObjV(minInd(1)))]);














    
    
    
    
    
    
    
    
    
    
    
    
    




















