% ����ÿ��ָ��� 12���·�����ÿ���·��¶�ƽ���ͼ
figure(1);
Weng=zeros(4,12);
for i=1:12 
    for j=1:4 %ÿѭ����������ָ����¶ȱ仯����
        index=FenHSum(j,i);
        Weng(j,i)=WenP(index,i);
    end
end

cftool(1:12,WenQ);
for i=1:4
    cftool(1:12,Weng(i,:));
end

%����12���·� 0�¶���� �������仯ͼ
 figure(2);
 plot(1:12,WenZ);