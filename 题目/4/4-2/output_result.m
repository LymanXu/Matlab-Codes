function y = output_result( L_best,R_best,C)
%����������
index=find(L_best==min(L_best));
%index=L_best_f(1);
route=R_best(index(1),:);
length=L_best(index(1),1);
disp('���ŵ�·��Ϊ��');disp(route);
disp('��̵�·������Ϊ��');disp(length);

x=[];y=[];
[nn n]=size(route);
for i=1:n
    hold on
    x=[x;C(route(1,i),1)];%,C(route(1,i),2)];
    y=[y;C(route(1,i),2)];
   % y=[y;C(route(1,(i+1)),1),C(route(1,(i+2)),2)];
end
x=[x;C(route(1,1),1)];
y=[y;C(route(1,1),2)];
plot(x,y,'o-'),title('TSP����·��');
axis([0 10 0 10]);

end

