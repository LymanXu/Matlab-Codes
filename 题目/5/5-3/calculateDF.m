%% ��Ƶ����������DF����




%ѡȡP��Ƶ�����ǰ100�н��з���
[m,n]=size(P);
for i=1:m
    sumP(i)=sum(P(i,:));
end
[newp,newpindex]=sort(sumP,'descend');
L=length(newpindex);
for i=1:100
newP(i,:)=P(newpindex(i),:);
newCiInFileN(i,1)=CiAppearInFileN(newpindex(i),1);
end
[m,n]=size(newP);
%
TF=zeros(m,n);
W=zeros(m,n);
N=n; %nƪ�ĵ���������
for i=1:m  %ÿ��һ���ؼ���
    for j=1:n
        TF(i,j)=newP(i,j)*log2(N/newCiInFileN(i,1)+0.01);
      
    end
end
%��һ��

for j=1:n  %ÿ��һ��
 sumX=0;
    for i=1:m
         sumX=sumX+(TF(i,j)*(log2(N/newCiInFileN(i,1)+0.01)))^2;
    end
    sumX=sqrt(sumX);
    disp(sumX);
    for k=1:m  %����һ��Ԫ��
        W(i,j)=TF(i,j)./sumX;
    end
end