function [y pbest]= fitness(position,pbest,fvalue)
%������Ӧ�Ⱥ���Ϊī����ñ�����������ֵ
%r=sqrt(position(1,:).^2+position(2,:).^2)+eps;
%z=sin(r)./r;  %��Ϊ����Ӧ��
[s,n]=size(position);
z=zeros(1,n);
for i=1:n
%r=sqrt(position(i,1).^2+position(i,2).^2)+eps;
%f(i,1)=sin(r)./r;  %��Ϊ����Ӧ��
x=position(1,i);y=position(2,i);
s=(x^2+y^2)^0.5;
ep=cos(2*pi*x)+cos(2*pi*y);
z(i)=sin(s)/s+exp(ep/2)-2.71289;
end

%��ÿ�εõ�λ�ü�������Ӧ�Ƚ��л�ͼ
plot_fitness(position,z);
y=fvalue;
n=length(pbest);
for i=1:n
    if z(i)>fvalue(i)  %�µ�λ�õ� ����Ӧ�� ������ʷ���ŵ�
        pbest(:,i)=position(:,i);
        y(i)=z(i);
    end
end
    
end

