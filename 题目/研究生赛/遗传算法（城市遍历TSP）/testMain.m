%% ������

clc
close all
%X=[];  %��������
NIND=100; %��Ⱥ��С
MAXGEN=100;
Pc=0.9; %�������
Pm=0.05; %�������
GGAP=0.9; %����

%D ��Ϊʱ�����
%D=Distance(X);
%% ��Ҫ���ĵ�λ�� 1  ���������ĳ�ʼ������
D=TcarXinJiang;
tCity=D;tPlay=Tplay;
N=size(D,1);
%

%% 1 ��ʼ����Ⱥ
Chrom=InitPop(NIND,N);
Chrom=tiaoZhengChrom(Chrom);
%������ʼ·��ͼ
DRang=[30,110];
%DrawPath(Chrom(1,:),X,DRang);
pause(0.0001)
%�����ʼ·�ߺ��ܾ���
disp('��ʼ��Ⱥ�е�һ�����ֵ��')
OutputPath(Chrom(1,:));
Rlength=PathLength(D,Chrom(1,:));
Daylength=DayLength(tCity,tPlay,Chrom(1,:));
disp(['�ܾ��룺',num2str(Rlength)]);
disp(['��������',num2str(Daylength)]);
disp('---------------------------------------------------------------------');

%% 2 �����Ż�
gen=0;
figure;
hold on;box on
xlim([0,MAXGEN])
xlabel('����')
ylabel('����ֵ')
%ObjV=PathLength(D,Chrom);  %����·�߳���
ObjV=DayLength(tCity,tPlay,Chrom);
preObjV=min(ObjV);
while gen<MAXGEN
    %������Ӧ��
    ObjV=DayLength(tCity,tPlay,Chrom);
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
    Chrom=tiaoZhengChrom(Chrom);
    gen=gen+1;
    disp(['�� ',num2str(gen),' ��']);
end
%% 3 �������Ž�·��ͼ
ObjV=DayLength(tCity,tPlay,Chrom);
[minObjV,minInd]=min(ObjV);
%DrawPath(Chrom(minInd(1),:),X,DRang);
%������Ž�·�ߺ��ܾ���
disp('���Ž⣺')
p=OutputPath(Chrom(minInd(1),:));
disp(['��������',num2str(ObjV(minInd(1)))]);

Rlength=PathLength(D,Chrom(minInd(1),:));
disp(['�ܾ��룺',num2str(Rlength)]);














    
    
    
    
    
    
    
    
    
    
    
    
    




















