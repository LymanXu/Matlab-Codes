function [index, best_roadL, ave ,road_L] = select_bestRoad(PathTiaoEndNodeI,Tabu,D,m,n)
%Ѱ�ұ��ε�������Ⱥ�����ŵ�·��,PathTiao  ÿ�����ϵ�����
road_L=zeros(m,1);

%���� 
%tang=length(PathTiaoEndNodeI);
index=find(PathTiaoEndNodeI==0);
index=index-1;
index=index(1);
tang=index;
%LuSumI=0;
for i=1:m   %m ������
    
for j=1:(n-1) %����ÿ��·��ֵ=��ѭ��+������ԭ��ľ���
    qian=Tabu(j);
    hou=Tabu(j+1);
    road_L(i,1)=road_L(i,1)+D(qian,hou);
end
for j=1:tang
    qian=Tabu(PathTiaoEndNodeI(j));
    road_L(i,1)=road_L(i,1)+D(qian,1);
end
%���� ���һ�λ�ԭ��ľ���
lastn=Tabu(i,n);
 road_L(i,1)= road_L(i,1)+D(lastn,1);
end

    
best_roadL=min(road_L);
index_p=find(road_L==best_roadL); %����·�������
index=index_p(1);
ave=mean(road_L);  %���ε������ƽ������


end

