%% ģ���˻��㷨���нű� 
clc,clear;
close all;
%%  1 ������ʼ��
tic
T0=1000;   %��ʼ�¶�
Tend=1e-3; %��ֹ�¶�
L=200; %���¶��µĵ�������
q=0.9;   %��������
x=[];   %�������е�����
D=Distance(x);   %������еľ������
N=size(D,1);   %���еĸ���
%�⣨·�ߣ��ĳ�ʼ��
S1=randperm(N);

%����������·��ͼ
DrawPath(S1,X);
pause(0.0001)
%���������·���;���
disp('��ʼ�����·��');
OutputPath(S1);
Rlength=PathLength(D,S1);
disp(['�ܾ��룺',num2str(Rlength)]);

%�������������Time
Time=ceil(double(solve(['1000*(0.9)^x=',num2str(Tend)])));
count=0;   %��������
Obj=zeros(Time,1);   %Ŀ��ֵ����ĳ�ʼ��
track=zeros(Time,N);  %ÿ��������·�߾���ĳ�ʼ��

%% 2 ���� 
% L Ϊ���¶��µĵ�������
while T0>Tend
    count=count+1;
    temp=zeros(L,N+1);
    for k=1:L   %ÿ���¶��µĵ�������
        %�����µĽ�
        S2=NewAnswer(S1);
        %Metropolis�����ж��Ƿ�����µĽ�
        [S1,R]=Metropolis(S1,S2,D,T0);
        temp(k,:)=[S1,R];   %��¼��һ·�߼���·��
    end
    % ��¼ÿ�ε��������е�����·��e
    [d0,index]=min(temp(:,end));   %��ǰ�¶��µ�����·��
    if count==1|| d0<Obj(count-1)  %�����ǰ�¶��µ�����·��< ��һ·�̣����¼��ǰ��
        Obj(count)=d0;
    else
        Obj(count)=Obj(count-1);  %�����ǰ������·�̴����ϴΣ����¼�ϴε�
    end
    track(count,:)=temp(index,1:end-1);   %��¼��ǰ�¶ȵ�����·��
    T0=q*T0;  %����
    disp(['��ǰ��������Ϊ��',num2str(count)]);
end

%% 3 ��������ͼ
figure
plot(1:count,Obj)
xlabel('��������')
ylabel('����')
title('�Ż�����')

% ���Ž��·��ͼ
DrawPath(track(end,:),X)

%������Ž��·��ͼ���ܾ���
disp('���Ž�')
S=track(end,:);
p=OutputPath(S);
disp(['�ܾ��룺',num2str(PathLength(D,S))]);
toc
        
        
