%mΪ�洢���·��
clc,clear
n=58;
a=textread('�������Դ����.txt');
a(a==Inf)=0;
a=a+a';
a(a==0)=inf;
a([1:n+1:n^2])=0;
z=[];
m=[];
c=[];
for i=1:8
    for j=1:35
        [x,y]=myfloyd(a,i,j);  
        c=size(y);
        z=[y,zeros(1,10-c(2))];
        for k=1:10
            m(i,j,k)=z(k);        
        end
    end   
end


