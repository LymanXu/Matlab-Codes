function f= fitness(position )
%��������Ⱥ��ÿ���������Ӧ��
%������Ӧ�Ⱥ���Ϊī����ñ�����������ֵ
[m,n]=size(position);
f=zeros(m,1);
for i=1:m
%r=sqrt(position(i,1).^2+position(i,2).^2)+eps;
%f(i,1)=sin(r)./r;  %��Ϊ����Ӧ��
x=position(i,1);y=position(i,2);
s=(x^2+y^2)^0.5;
ep=cos(2*pi*x)+cos(2*pi*y);
f(i)=sin(s)/s+exp(ep/2)-2.71289;
end

end

