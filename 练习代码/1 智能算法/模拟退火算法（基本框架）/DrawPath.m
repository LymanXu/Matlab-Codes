function [ ] = DrawPath(s,x)
%����·�ߺͳ������껭��·��ͼ
n=size(s,1);
R=[s(1,:) s(1,1)];
figure;
hold on
plot(x(:,1),x(:,2),'o','color',[0.5,0.5,0.5])
plot(x(R(1,1),1),x(R(1,1),2),'rv','MarkerSize',20)

for i=1:n
    text(x(i,1)+0.05,x(i,2)+0.05,num2str(i),'color',[1,0,0]);
end

A=x(R,:);
row=size(A,1);
for i=2:row
    [arrowx,arrowy]=dsxy2figxy(gca,A(i-1:i,1),A(i-1:i,2));%����ת��
    annotation('textarrow',arrowx,arrowy,'HeadWidth',8,'color',[0,0,1]);
end

hold off
xlabel('������')
ylabel('������')
title('�켣ͼ')
box on

end

