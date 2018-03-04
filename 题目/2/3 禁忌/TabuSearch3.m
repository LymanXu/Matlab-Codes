%function [BestShortcut,theMinDistance]=TabuSearch
clear;
clc;
Clist=[25	85
22	75
22	85
40	15
38	15
60	80
58	75
55	80
55	85
55	82
25	30
55	60
30	60
50	35
30	25
45	65
45	30
35	40
41	37
40	60
31	52
35	69
47	47
49	58
27	43
37	31
24	58
37	47
49	42
53	43
61	52
57	48
56	37
55	54
26	52
26	35
31	67
];

CityNum=size(Clist,1);%TSP����Ĺ�ģ,��������Ŀ
dislist=zeros(CityNum); %�������
for i=1:CityNum
    for j=1:CityNum
        dislist(i,j)=((Clist(i,1)-Clist(j,1))^2+(Clist(i,2)-Clist(j,2))^2)^0.5;       
    end
end
TabuList=zeros(CityNum);% ���ɱ���������������������
TabuListf=Inf*ones(CityNum);%
TabuLength=100;%���ɳ���(tabu length)
Candidates=CityNum*(CityNum-1)/2;%��ѡ���ĸ��� (ȫ����������)
CandidateNum=zeros(Candidates,CityNum);%��ѡ�⼯��
%S0=[5	2	3	1	4	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	30	29	28	31	32	33	34	35	36	37];
S0=[36	31	11	23	21	16	25	37	30	18	28	17	14	34	24	22	10	6	33	2	15	13	27	5	20	12	19	8	9	1	3	4	35	7	29	32	26
]; 
BSF=S0; %��ǰ���ŷ���
BestL=Inf; %��ǰ��Ӧ��������ֵ
clf; 
figure(1);
stop = uicontrol('style','toggle','string','stop','background','white');
tic;
p=1;
StopL=80*CityNum;%δ֪����������������
while p<StopL %һ���ж�
    if Candidates>CityNum*(CityNum-1)/2
        disp('��ѡ�����������n*(n-1)/2!');
        break;
    end
    ALong(p)=Fun3(dislist,S0);     %��p�ε�����Ӧ�Ⱥ���ֵ
    
    A=zeros(Candidates,4);
    k=1;
    for i=1:CityNum
        for j=i+1:CityNum
            A(k,1)=i;%�����еĴ���
            A(k,2)=j;
            A(k,3)=min(S0(i),S0(j));%ʵ�ʵ�ı��  
            A(k,4)=max(S0(i),S0(j));
            k=k+1;
        end
    end
    
     %δ֪ ��Ҫ����������������ò��������һ���������
    %while i<=Candidates        
     %   M=CityNum*rand(1,2);
       % M=ceil(M);
       % if M(1)~=M(2)
       %     A(i,1)=max(M(1),M(2));
        %    A(i,2)=min(M(1),M(2));
         %   if i==1
         %       isa=0;
          %  elseif TabuList(A(i,1),A(i,2)~=0)
          %      isa=1;
                
      %      else
          %      for j=1:i-1
          %          if A(i,1)==A(j,1) && A(i,2)==A(j,2) %�ж��Ƿ����
           %             isa=1;%��ǳ���
         %               break;
          %          else
     %                   isa=0;
      %              end
      %          end
    %        end 
    %        if ~isa
    %           i=i+1;
   %         else 
   %         end            
    %    else 
    %    end
   % end
    
    BestCandidateNum=Candidates;%����ǰBestCandidateNum����ú�ѡ�⣨�����ʣ�
    BestCandidate=Inf*ones(BestCandidateNum,4);%��ʼ��
    F=zeros(1,Candidates);%����Ӧ�Ⱥ���ֵ
    for i=1:Candidates
        CandidateNum(i,:)=S0;
        CandidateNum(i,[A(i,2),A(i,1)])=S0([A(i,1),A(i,2)]);
        F(i)=Fun3(dislist,CandidateNum(i,:));
        BestCandidate(i,2)=F(i);
        BestCandidate(i,1)=i;
        BestCandidate(i,3)=A(i,3);
        BestCandidate(i,4)=A(i,4);  
        if TabuList(BestCandidate(i,3),BestCandidate(i,4))~=0
        
        
        
        end
    end
    %��BestCandidate 
    [JL,Index]=sort(BestCandidate(:,2)); %����
    SBest=BestCandidate(Index,:);
    BestCandidate=SBest;
    
    if BestCandidate(1,2)<BestL
        BestL=BestCandidate(1,2);
        S0=CandidateNum(BestCandidate(1,1),:);   %���е�����     
        BSF=S0;%���ŷ���
        for m=1:CityNum
            for n=1:CityNum
                if TabuList(m,n)>TabuList(BestCandidate(1,3),BestCandidate(1,4))
                    TabuList(m,n)=TabuList(m,n)-1;
                end
            end
        end
        TabuList(BestCandidate(1,3),BestCandidate(1,4))=TabuLength;
        TabuListf(BestCandidate(1,3),BestCandidate(1,4))=BestCandidate(1,2);
    else  
        for i=1:BestCandidateNum
            if  TabuList(BestCandidate(i,3),BestCandidate(i,4))==0
                S0=CandidateNum(BestCandidate(i,1),:);                
            for m=1:CityNum
                for n=1:CityNum
                    if TabuList(m,n)~=0
                        TabuList(m,n)=TabuList(m,n)-1;
                    end
                end
            end        
            TabuList(BestCandidate(i,3),BestCandidate(i,4))=TabuLength;
            TabuList(BestCandidate(i,3),BestCandidate(i,4))=BestCandidate(1,2);
            break;
            end
        end
    end    
    p=p+1;
    ArrBestL(p)=BestL;
    for i=1:CityNum-1
        plot([Clist(BSF(i),1),Clist(BSF(i+1),1)],[Clist(BSF(i),2),Clist(BSF(i+1),2)],'bo-');
        hold on;
    end
    plot([Clist(BSF(CityNum),1),Clist(BSF(1),1)],[Clist(BSF(CityNum),2),Clist(BSF(1),2)],'ro-');
    title(['Counter:',int2str(p*Candidates),'  The Min Distance:',num2str(BestL)]);
    hold off;
    pause(0.005);    
    if get(stop,'value')==1
        break;
    end
end
toc;
BestShortcut=BSF;
theMinDistance=BestL;
set(stop,'style','pushbutton','string','close', 'callback','close(gcf)');
figure(2);
plot(ArrBestL,'r'); hold on;
plot(ALong,'b');grid;
title('��������');
legend('Best So Far','��ǰ��');