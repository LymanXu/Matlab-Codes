%�ɰ�Ǿ�������ȫ����
a=Tcar;
[m,n]=size(a);
for i=1:m
    for j=(i+1):n
        aI=a(i,j);
        a(j,i)=aI;
    end
end
Tcar=a;