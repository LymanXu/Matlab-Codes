function ZDistance = caldistance(Z,ZBest,ZLowst)
%��������������������ľ���
[m,n]=size(Z);
ZDistance=zeros(1,m);
for i=1:m
Msum=sum((ZBest-Z(i,:)).^2);
D_B=sqrt(Msum);
Minsum=sum((ZLowst-Z(i,:)).^2);
D_L=sqrt(Minsum);
CI=D_L/(D_B+D_L);

ZDistance(1,i)=CI;
end
%ͳ�Ʋ�������
disp('��������ľ���Ϊ��');disp(ZDistance);
ZD=ZDistance;
for i=1:m
    ZDmax=max(ZD);
    index=find(ZD==ZDmax);
    disp(['��',num2str(i),' �����Ŷ������Ϊ  ',num2str(index)]);
    disp(['����Ϊ',num2str(ZDmax)]);
    ZD(index)=0;
    
end









