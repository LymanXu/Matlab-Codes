function f= fitness(position )
%��������Ⱥ��ÿ���������Ӧ�ȣ�ƥ���Խ����Ӧ��Խ��
[m,n]=size(position);
f=zeros(m,1);
%��ʵӰ������
ylN=14;
%����4��
   TrueYL=[2.392827617
2.353895105
2.313843963
2.272674191
2.23038579
2.186978759
2.142453098
2.096808807
2.050045887
2.002164337
1.953164158
1.903045349
1.85180791
1.799451841
];
for i=1:m
%��������Ӷ�Ӧ��Ӱ������
w=position(i,1);j=position(i,2);chi=position(i,3);
%flag0=0ʱ��˵���õ㲻����f=0
[flag0,YingLI]=CalculateYingL(w,j,chi);
%���Ӱ�����к���ʵ���е�ƥ���
%��¼Ӱ�ӳ�������
%YingL(i,:)=YingLT';
%�� 1 �ֱȽ����ƺ���
%ylMax=max(YingLI);
%newYL=YingLI/ylMax;
%distance=(newYL-TrueYL).^2;
%distance=sum((YingLI-TrueYL).^2);
%f(i,1)=1/sum(distance);
%valueCheng=chengFa2(w,j);%�����Ƿ��ڷ�Χ��
%����ͷ�����
if flag0==1
    distance=sum((YingLI-TrueYL).^2);
f(i,1)=1/sum(distance);
%xx=sum(YingLI.*TrueYL);
%x1L=(sum(YingLI.^2))^0.5;
%x2L=(sum(TrueYL.^2))^0.5;
%f(i,1)=xx/(x1L*x2L);
%���Toptic��
%fangtyl=(sum(YingLI.^2)).^0.5;
%z=YingLI./fangtyl;
%d=(sum((TrueYL-z).^2)).^0.5;
%d ԽС��Խ���ƣ���Ӧ��Խ��
%f(i,1)=1/d;
else
    f(i,1)=0;
end
%����غ���
%FI=corrcoef(YingLI,TrueYL);
%f(i,1)=FI(1,2);
%end
end

end

