function  DrawPath( Chrom,X,rang )
%��������·�ߵĹ켣ͼ
%Chrom ����·��  X �������е�����
R=[Chrom(1,:),Chrom(1,1)];  %һ��Ѳ��·��
figure;
hold on
plot(X(:,1),X(:,2),'o','color',[0.5,0.5,0.5])
plot(X(Chrom(1,1),1),X(Chrom(1,1),2),'rv','MarkerSize',20)
for i=1:size(X,1)
    text(X(i,1)+0.05,X(i,2)+0.05,num2str(i),'color',[1,0,0]);
end
A=X(R,:);
row=size(A,1);
xlim([10,30]);ylim([80,110]);
for i=2:row
    %[arrowx,arrowy]=dsxy2figxy(gca,A(i-1:i,1),A(i-1:i,2)); %����ת��
    arrowx=A(i-1:i,1)./rang(1);
    arrowy=A(i-1:i,2)./rang(2);
    annotation('textarrow',arrowx,arrowy,'HeadWidth',8,'color',[0,0,1]);
end
hold off
xlabel('������')
ylabel('������')
box on

end

