function [y pbest]= fitness(position,pbest,fvalue)
%������Ӧ�Ⱥ���Ϊī����ñ�����������ֵ
N=size(fvalue,2);
for i=1:N
    jx=(loc(:,2)-position(2,i))+(loc(:,1)-position(1,i))/sqrt(2)+sqrt(2)*(position(1,i)-loc(:,1));
    jy=(loc(:,2)-position(2,i))+(loc(:,1)-position(1,i))/sqrt(2);
    jc=[jx,jy];
    %б�����¼��������
    theta_y=0.32*jx.*(1+0.0004*jx).^(-1/2);
    theta_z=0.24*jx.*(1+0.0001*jx).^(-1/2);
    %��ɢϵ��
    u=1;%����
    height=25;%����߶�
    qiangdu=[];
    qiangdu=position(4,i)./(2*pi*u.*theta_y.*theta_z).*exp(-jy.^2./(2*theta_y.^2).*(exp(-(height-position(i,3).^2/(2*theta_z.^2))+exp(-(height+position(i,3)).^2/(2*theta_z.^2)))));
    %�������ǿ��
    z(i)=sum((qiangdu-shice).^2);
    %�в������
end
    


y=fvalue;
n=length(pbest);
for i=1:n
    if z(i)>fvalue(i)  %�µ�λ�õ� ����Ӧ�� ������ʷ���ŵ�
        pbest(:,i)=position(:,i);
        y(i)=z(i);
    end
end
    
end

