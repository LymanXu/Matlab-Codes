%% ������Ϊ��������Ⱥ�㷨����û�ж�����иĽ������Խ��TSP���⣬����������е�����

%% C n�����е����꣬n��2�ľ���
%% NC_max ����������
%% m ���ϸ���
%% Alpha ������Ϣ����Ҫ�̶ȵĲ���
%% Beta ��������ʽ������Ҫ�̶ȵĲ���
%% Rho ��Ϣ������ϵ��
%% Q ��Ϣ������ǿ��ϵ��
%% R_best �������·��
%% L_best �������·�ߵĳ���
%clc,clear;
%% ��һ���������ĳ�ʼ������ʼÿ���ߵ���Ϣ�������
%����������꣬���س��й�ģN ���������D 
% a ��demand=[0;demand];
demand=cxuqiu;
[m, n ,D ,C]=input_C(cplot,demand,38,8);
%n=33   ����Ϊ32 ��
Time=D./5.4; %33*33
%�����TimeDown TimeEnd Ϊ32*32
% a �� TimeDown=[0;timedown];
TimeDown=ctimedown;
%ÿ�����ϴ�ʱ�ߵ�·Ŀǰ��ʱ
PathEndTime=zeros(m,1);
%TimeEnd ÿ������Ҫ������ʱ��
TimeEnd=zeros(n,1);
%a ��TimeEnd=[inf;timeend];
TimeEnd=cendtime;
%����������  XuQiu=input('����ÿ����������������');
%a �� XuQiu=[0;xuqiu];
XuQiu=cxuqiu;

%input�������ϵĳ��桯��
CarCun=ones(m,1)*120;
%���� ????? ������length(PathTiaoEndNode)����һ
PathTiao=ones(m,1);
PathTiaoEndNode=zeros(m,n);
%��Ӧ������ʣ����
CarEndCun=-9*ones(m,n);

%Eta Ϊ�������ӣ���Ϊ����ĵ���
Eta=1./D;
%TauΪ��Ϣ�ؾ���
Tau=ones(n,n); 

%Tabu ��¼����·��
Tabu=zeros(m,n);

%��������������
NC_max=50;
NC=1;
R_best=zeros(NC_max,n);       %�������·��
R_bestEnd=zeros(NC_max,n);
L_best=inf.*ones(NC_max,1);   %�������·�ߵĳ���
L_ave=zeros(NC_max,1);        %����·�ߵ�ƽ������
R_bestEnd=zeros(NC_max,n);
 R_bestTiao=zeros(NC_max,1);
 R_bestRoadL=zeros(NC_max,1);
 R_bestCarCun=zeros(NC_max,n);

%%����ʵ�֣�һȺ����ȫ��NC_maxѰ��ʳ��
while NC<=NC_max
    %%�ڶ�������mֻ���Ϸŵ���ʼ��ҩ��
    
Tabu(:,1)=1; %�������Ͼ���  ��ʵҩ�� ��ʼ
%����·Ŀǰ��ʱ��ʼ��Ϊ 0
%����
 
     
 %%��������mֻ���ϰ����ʺ���ѡ����һ�����У���ɸ��Ե�����
 
 for j=2:n
     for i=1:m   %ѡ��  ��i ֻ���� ��� j ��ѭ��  Ҫȥ��һ����
         visited=Tabu(i,1:(j-1)); 
         J=zeros(1,(n-j+1));  
         P=J;      %ȷ����һ���ʵĳ���Ҫ������Ϣ��ȷ���ĸ���
         %����ȷ�� ����i δ���ʵĳ��е����
         jn=1;
         for k=1:n   
             if length(find(visited==k))==0
                 J(jn)=k;
                 jn=jn+1;
             end
         end
         % ����δ���ʳ��еĸ��ʣ�����ETA�������ӣ�Tau��Ϣ�أ�ȷ���������ȼ�
         % �������� i �´�Ҫȥ�ĳ���
         to_visit=select_nextCity(J,visited,Eta,Tau,NC,NC_max);
              
        % TimeEnd Ϊÿ������Ҫ������ʱ��  ���Ҫ����PathEndTimeΪÿ��·Ŀǰ����ʱ��
        PathEndTimeI=PathEndTime(i,1); %û����һ�� ���£���ԭ��ʱ����
        
        %PathEndTime(i,1)=TimeEndTi(i,1)+Time(visited(j-1),to_visit);
         %%��  1 �ж� �ó����Ƿ���������  %�жϳ����Ƿ�
         
         %��� ��ѡ����һ���У��򷵻���һ���е���� to_visitNew  
         %��� ��Ҫ�����װ�������¼����·������ֹ����ţ���������·������ʼ������
         
         %%��Ҫ���   ���� XiuQiu  CheCun  Time TimeEnd
         endnode=visited(j-1);
         [to_visitFlag,to]=panDuanCity(n,J,endnode,to_visit,Time,TimeEnd,PathEndTimeI,Eta,Tau,visited,NC,NC_max);  %�ж��ܷ�ѡ����һ���� ���ܷ��� 1 ���� ���� 0
          % to Ϊ�ܷ��ʵĳ��е����,�Ѿ��������е�
          
         if to_visitFlag==1  
    
              %�жϳ��湻��,���Ļ����� 1  �������� 0
              CarFlag=panDuanCar(CarCun(i,1),XuQiu(to));
              if CarFlag==1
                  to_visitNew=to;
                  %���³���
                   CarCun(i,1)=CarCun(i,1)-XuQiu(to_visitNew);
                   %��������·��ʱ��
                   PathEndTime(i,1)=PathEndTime(i,1)+Time(visited(j-1),to_visitNew)+TimeDown(to_visitNew);
                  
              else %���� ֱ�ӻ����   ���������������ط��� ����Ϊ������������С
                  %���� ��һ·����ʼ�� ����һ·��������
                  TabuI=Tabu(i,:);
                  [ToNew,PathEnd]=huiYuanDian(J,visited,Eta,Tau,TabuI,NC,NC_max);
                  %����   i �����ϵ��߹� �洢·���� �����ı��� ��·��  % �õİ���
                  %PathTiao(i)=[PathTiao(1:length(PathTiao(i))),PathEnd];
                  to_visitNew=ToNew;
                  %��¼��ʱ����
                  CarEndCun(i,:)=noteCarEndCun(CarEndCun(i,:),CarCun(i,1));
                   %��װ����
                   CarCun(i,1)=120;
                   PathTiao(i,1)=PathTiao(i,1)+1;
                   %��������·��ʱ��
                   PathEndTime(i,1)=0;
                   %���µ�·���� ����һ�����ʱ��
                   PathEndTime(i,1)=Time(1,ToNew);
                   
                   % ���� ǰ·������󶥵�
                   ZiPathI=addEndNode(PathEnd,PathTiaoEndNode(i,:));
                   PathTiaoEndNode(i,:)=ZiPathI;
                  
              end
         
         else  %����ѡ����һ����,��ʣ�����е㳬ʱ �����ϻ�ԭ�㣬�൱�� ������������
               TabuI=Tabu(i,:);
             [ToNew,PathEnd]=huiYuanDian(J,visited,Eta,Tau,TabuI,NC,NC_max);
             %����   i �����ϵ��߹� �洢·���� �����ı��� ��·��  % �õİ���
               
                  %PathTiao(i)=[PathTiao(1:length(PathTiao(i))),PathEnd];
                  to_visitNew=ToNew;
                  
                  %��¼��ʱ����
                  CarEndCun(i,:)=noteCarEndCun(CarEndCun(i,:),CarCun(i,1));
                   %��װ����
                  CarCun(i,1)=120;
                  PathTiao(i,1)=PathTiao(i,1)+1;
                  %��������·��ʱ��
                   PathEndTime(i,1)=0;
                     %���µ�·���� ����һ�����ʱ��
                   PathEndTime(i,1)=Time(1,ToNew);
                  
                   % ���� ǰ·������󶥵�
                   ZiPathI=addEndNode(PathEnd,PathTiaoEndNode(i,:));
                   PathTiaoEndNode(i,:)=ZiPathI;
         end
         
       Tabu(i,j)=to_visitNew; 
     end
 end
 %% ���Ĳ� ��¼���ε��������·��,�����ǵڼ������ϵ�·��
 %���·������ţ����ϵ���ţ� ���·������  ���ε���ƽ������  �����ϵ�·��
 [n_bestRoad, road_L]=select_bestRoad(PathTiaoEndNode,Tabu,D,m,n, PathTiao,CarEndCun);
 %L_best(NC,1)=L_bestRoad;   %���ų���
 R_best(NC,:)=Tabu(n_bestRoad,:); %����·��
 %���ϼ�¼ ÿ��·�����յ��յ�
 R_bestEnd(NC,:)=PathTiaoEndNode(n_bestRoad,:);
 R_bestTiao(NC,1)=PathTiao(n_bestRoad,1);
 R_bestRoadL(NC,1)=road_L(n_bestRoad,1);
 R_bestCarCun(NC,:)=CarEndCun(n_bestRoad,:);
 %L_ave=ave;
 
 %% ���岽 ������Ϣ��
 Tau=adapt_Tau(Tau,Tabu,road_L,m,n,PathTiao);
 
 %%�����������ɱ����㣬Ϊ�´ε�����׼��
  disp(['��',num2str(NC),'�ε���']);
   NC=NC+1;
   for i=1:m
   disp(['���ε����� ',num2str(i),'���ϵ�·�ߣ�',num2str(Tabu(i,:))]);
   end
   disp(['���ε������������ϵ�·�ߣ�',num2str(Tabu(n_bestRoad,:))]);
   disp(['ÿ��·����ĩβ���㣺',num2str(PathTiaoEndNode(n_bestRoad,:))]);
   %disp(['������Ϣ�������']);disp(Tau);
  %����
   Tabu=zeros(m,n);
   PathEndTime(:,1)=0;
   PathTiaoEndNode(:,:)=0;
    %��Ӧ������ʣ����
   CarEndCun=-9*ones(m,n);
   PathTiao=ones(m,1);
 
end

%% ��� ������    R_best �������·�� L_best �������·�ߵĳ���
output_result(R_best,C,R_bestTiao,R_bestEnd,R_bestRoadL,R_bestCarCun);





















