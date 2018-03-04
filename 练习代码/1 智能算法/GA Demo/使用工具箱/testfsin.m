%% ���f=sin(10*pi*x)/x ,x��(1,2) ����Сֵ
clc
clear all
close all

%1 ��������ͼ
figure(1);
hold on;
lb=1;ub=2;
ezplot('sin(10*pi*x)/x',[lb,ub]);
xlabel('X');
ylabel('Y');

%% 2 �����Ŵ��㷨����
Nind=40;              %��Ⱥ��С
Maxgen=20;            %����Ŵ�����
Preci=20;             %���峤��
Ggap=0.95;            %����
px=0.7;               %�������
pm=0.01;              %�������
trance=zeros(2,Maxgen); %Ѱ�Ž����ʼֵ
FieldD=[Preci;lb;ub;1;0;1;1];
Chrom=crtbp(Nind,Preci); %������Ⱥ

%%�Ż�
gen=0;
X=bs2rv(Chrom,FieldD);  %��ʼ��Ⱥ�����Ƶ�ʮ����
ObjV=sin(10*pi*X)./X;   %����Ŀ�꺯��ֵ

while gen<Maxgen
    FitnV=ranking(ObjV); %��������Ӧ��
    SelCh=select('sus',Chrom,FitnV,Ggap);   %  �Ӵ�����
    SelCh=recombin('xovsp',SelCh,px); %��������
    SelCh=mut(SelCh,pm);     %����
    X=bs2rv(SelCh,FieldD);    %���������ת��Ϊʮ����
    ObjVSel=sin(10*pi*X)./X;  %�����Ӵ������Ŀ��ֵ
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel); %�ز��룬���Ӵ����¸�����Ⱥ
    X=bs2rv(Chrom,FieldD);
    gen=gen+1;      
    
    %��ȡû�������Ž� ������� ��Y���Ž� I Ϊ���
    [Y,I]=min(ObjV);
    trance(1,gen)=X(I);  %ÿ������ֵ��X
    trance(2,gen)=Y;      %ÿ������ֵ ��Y
end
plot(trance(1,:),trance(2,:),'bo');
xlabel('�������');ylabel('����ֵ');

hold off
%������ͼ
figure(2);
plot(1:Maxgen,trance(2,:));
grid on
xlabel('�Ŵ�����');
ylabel('��ı仯');
title('��������');
bestY=trance(2,end);
bestX=trance(1,end);
fprintf(['���Ž�:\nX=',num2str(bestX),'/nY=',num2str(bestY)]);