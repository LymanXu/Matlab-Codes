function [bestindex,road_L] = select_bestRoad(PathTiaoEndNodeI,Tabu,D,m,n, PathTiao,CarEndCun)
%Ѱ�ұ��ε�������Ⱥ�����ŵ�·��,PathTiao  ÿ�����ϵ����� + ÿ�˳���ʣ��
road_L=zeros(m,1);
bestGoal=10000*ones(m,1); %�����
%���� 
c1=0.5;c2=0.5;
%tang=length(PathTiaoEndNodeI);
%index=find(PathTiaoEndNodeI==0);
%index=index-1;
%index=index(1);
%tang=index;
tang=PathTiao-1;
%LuSumI=0;
for i=1:m   %m ������
    
for j=1:(n-1) %����ÿ��·��ֵ=��ѭ��+������ԭ��ľ���
    qian=Tabu(i,j);
    hou=Tabu(i,j+1);
    road_L(i,1)=road_L(i,1)+D(qian,hou);
end
for j=1:tang(i)
    qian=Tabu(PathTiaoEndNodeI(i,j));
    road_L(i,1)=road_L(i,1)+D(qian,1);
end
%���� ���һ�λ�ԭ��ľ���
lastn=Tabu(i,n);
 road_L(i,1)= road_L(i,1)+D(lastn,1);
end
%�õ� m �����ϵ���·����

%��ѡ���������ȿ���  �������� Ȼ�����ͳ���
TPathTiao=PathTiao;
index=find(TPathTiao==min(TPathTiao));
lindex=length(index);
if lindex==1 %�ݴ�����ѡ���� �����������ٵ�
    bestindex=index;
else
    %���� ����ͳ����ж�
    for i=1:lindex
        antI=index(i);
    bestGoal(antI,1)=c1*road_L(antI,1)+c2*CarEndCun(antI,1);
    end
    index=find(bestGoal==min(bestGoal));
    index=index(1);
    bestindex=index;
end

    
%best_roadL=min(road_L);
%index_p=find(road_L==best_roadL); %����·�������
%index=index_p(1);
%ave=mean(road_L);  %���ε������ƽ������


end

