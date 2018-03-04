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
clc,clear;
%% ��һ���������ĳ�ʼ������ʼÿ���ߵ���Ϣ�������
%����������꣬���س��й�ģN ���������D 
[m n D C]=input_C();

%Eta Ϊ�������ӣ���Ϊ����ĵ���
Eta=1./D;
%TauΪ��Ϣ�ؾ���
Tau=ones(n,n); 

%Tabu ��¼����·��
Tabu=zeros(m,n);

%��������������
NC_max=10;
NC=1;
R_best=zeros(NC_max,n);       %�������·��
L_best=inf.*ones(NC_max,1);   %�������·�ߵĳ���
L_ave=zeros(NC_max,1);        %����·�ߵ�ƽ������

%%����ʵ�֣�һȺ����ȫ��NC_maxѰ��ʳ��
while NC<=NC_max
    %%�ڶ�������mֻ���Ϸŵ�n��������
     Randpos=[];
     %Randpos=randperm(n);
     %Tabu(:,1)=(Randpos(1,1:m))';  %��ʼ��ÿ�����ϵ�·�������
     %Randpos=[];   %�漴��ȡ
     for i=1:(ceil(m/n))
     Randpos=[Randpos,randperm(n)];
     end
Tabu(:,1)=(Randpos(1,1:m))';
     
 %%��������mֻ���ϰ����ʺ���ѡ����һ�����У���ɸ��Ե�����
 for j=2:n
     for i=1:m   %��i ֻ����
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
         to_visit=select_nextCity(J,visited,Eta,Tau);
         Tabu(i,j)=to_visit;  
     end
 end
 %% ���Ĳ� ��¼���ε��������·��,�����ǵڼ������ϵ�·��
 [n_bestRoad L_bestRoad ave road_L]=select_bestRoad(Tabu,D,m,n);
 L_best(NC,1)=L_bestRoad;   %���ų���
 R_best(NC,:)=Tabu(n_bestRoad,:); %����·��
 L_ave=ave;
 
 %% ���岽 ������Ϣ��
 Tau=adapt_Tau(Tau,Tabu,road_L,m,n);
 
 %%�����������ɱ����㣬Ϊ�´ε�����׼��
    Tabu=zeros(m,n);
    
   disp(['��',num2str(NC),'�ε���']);
   NC=NC+1;
end

%% ��� ������
output_result(L_best,R_best,C);





















