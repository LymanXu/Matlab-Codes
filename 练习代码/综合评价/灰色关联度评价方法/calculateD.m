function [ distance,Dp,DpSum] = calculateD( xN,yN)
%�����Ӧ��ļ��,�����й淶�� ����ֹ���̫�󣬵õ�����ϵ��

[m,n]=size(xN);
D=zeros(m,n);
Dp=zeros(m,n);
for i=1:n
    D(:,i)=abs(yN-xN(:,i));
end
distance=D;

% �õ��������� ���й淶�� ����ֱ�ϵ�� P =0.4
p=0.4;
 DmaxI=max(D);
  DmaxI=max(DmaxI);
  disp('DmaxI=');disp(DmaxI);
 DminI=min(D);
 DminI=min(DminI);
 disp('DminI=');disp(DminI);
for i=1:n
    D(:,i)=D(:,i)+p*DmaxI;
    Dmin_P=DminI+p*DmaxI;
    Dp(:,i)=Dmin_P./(D(:,i));
end

DpSum=zeros(n,1);
for i=1:n
DpSum(i)=sum(Dp(:,i))/m;
end

%������
dps=DpSum;
disp('X �и�ָ��Ĺ����� ���δӸߵ��ͣ�');
for i=1:n
    index=find(dps==max(dps));
    index=index(1);
    disp(['��',num2str(i),' ��������ָ�����Ϊ��',num2str(index), ' �������Ϊ��',num2str(dps(index))]);
    
    %��dps �г������й��� Ԫ��
    dps(index)=-inf;
end


end

