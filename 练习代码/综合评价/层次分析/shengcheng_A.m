a=[];%һ��ָ���Ȩ��ֵ
n=length(a);
B=zeros(n);
for i=1:n
    ai=a(i);
    for j=1:n
        B(i,j)=a(j)/ai;
    end
end
