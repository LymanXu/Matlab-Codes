function main
%�ȴ������̵Ĳ�ֽⷨ
lda=0.000015;%lad��Ϊa^2
l=50;
h=0.05;%�ռ䲽��
alpha=0.5;
tao=alpha*h^2/lda; %ʱ�䲽��
N=l/h;%�ռ䲽��
M=100;%ʱ�䲽��������������û�����ƣ����������ȡ�˸�ֵ
for i=1:N+1
u(1,i)=fai((i-1)*h);
end
for k=1:M
u(k,1)=g1(k*tao);
u(k,N+1)=g2(k*tao);
end
for k=1:M
for i=2:N
u(k+1,i)=alpha*u(k,i+1)+(1-2*alpha)*u(k,i)+alpha*u(k,i-1);
end
plot([0:h:l],u(k+1,:)); 
hold on; pause(0.05);
end
function u=fai(x)
u=100;
function u=g1(x)
u=0;
function u=g2(x)
u=0;

