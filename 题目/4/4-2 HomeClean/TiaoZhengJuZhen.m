%��������ʹ��·��
A=Hzuoyi;
[m,n]=size(A);

AT=zeros(m,n);
j=m;
for i=1:m
  
        AT(i,:)=A(j,:);
        j=j-1;
end
