%ͨ�����ѭ�� dijkstral �㷨�� 1-8 �� 9-43 �����·��
d=inf*ones(8,35);

p=zeros(8*35,58);
for i=1:8
    for j=9:43
     [d(i,(j-8)),pe]=dijkstral(Ayuan,i,j );
     m=length(pe);
     pee=zeros(1,58);
     pee(1,1:m)=pe;
     p(i*(j-8),:)=pee;
    end
end

%��ʱP�д����е�·�� ����
for i=1:58
    index=find(p==i);
    sumi=length(index);
    disp(['����',num2str(i),'�������Ĵ���Ϊ��',num2str(sumi)]);
end