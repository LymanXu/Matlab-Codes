function [ yN,xN] = wuLiangGang(Y,X )
%���þ�ֵ���������������ٴ���
Nsum=length(Y);
ysum=sum(Y)/Nsum;
yN=Y./ysum;
[m,n]=size(X);

xN=zeros(m,n);
for i=1:n
    xsumI=sum(X(:,i))/Nsum;
    xN(:,i)=X(:,i)./xsumI;
end

end

