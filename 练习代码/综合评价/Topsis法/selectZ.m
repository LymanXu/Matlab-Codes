function [ZBest,ZLowst ] = selectZ(Z)
%��ѡ�������������
[m,n]=size(Z);
zh=zeros(1,n);
zl=zeros(1,n);
for i=1:n
    zh(i)=max(Z(:,i));
    zl(i)=min(Z(:,i));
end
ZBest=zh;
ZLowst=zl;

end

