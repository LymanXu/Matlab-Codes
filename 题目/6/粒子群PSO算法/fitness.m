function [y pbest]= fitness(position,pbest,fvalue)
%������Ӧ�Ⱥ���Ϊī����ñ�����������ֵ
r=sqrt(position(1,:).^2+position(2,:).^2)+eps;
z=sin(r)./r;  %��Ϊ����Ӧ��

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

