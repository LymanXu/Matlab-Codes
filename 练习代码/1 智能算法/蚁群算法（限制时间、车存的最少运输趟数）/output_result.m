function y = output_result(R_best,C,R_bestTiao,R_bestEnd,R_bestRoadL,R_bestCarCun)
%����������
%�ȿ�����������Ȼ�����ͳ���
c1=0.5;c2=0.5;
index=find(R_bestTiao==min(R_bestTiao));
lindex=length(index);
if lindex==1 %�ݴ�����ѡ���� �����������ٵ�
    bestindex=index;
else
    %���� ����ͳ����ж�
    for i=1:lindex
        antI=index(i);
    bestGoal(antI,1)=c1*R_bestRoadL(antI,1)+c2*sum(R_bestCarCun(antI,:));
    end
    index=find(bestGoal==min(bestGoal));
    index=index(1);
    bestindex=index;
end


route=R_best(bestindex,:); %һ�� ����
endNode=R_bestEnd(bestindex,:);
tang=R_bestTiao(bestindex,1);
lengthR=R_bestRoadL(bestindex,1);
carcun=R_bestCarCun(bestindex,:);
disp('���ŵ�·��Ϊ��');disp(route);
disp(';�г��ص�ԭ��Ĳ�����ţ�');disp(endNode);
disp('����·������Ϊ��');disp(tang);
disp('����·���ܳ���Ϊ��');disp(lengthR);
disp('����·�ߵ�ÿ�γ�������Ϊ��');disp(carcun);

x=[];y=[];
[nn n]=size(route);
for i=1:n
    x=[x;C(route(1,i),1)];%,C(route(1,i),2)];
    y=[y;C(route(1,i),2)];
   % y=[y;C(route(1,(i+1)),1),C(route(1,(i+2)),2)];
end
x=[x;C(1,1)];
y=[y;C(1,2)];
plot(x,y,'-');title('TSP����·��');

  
    
%hold on
%plot(C(1,1),C(1,2),'p');

end

