function Z = tongyi( X,Lowflag )
%�����ݽ��й�һ����ͳһ����,�ж�Ӧ����   �ж�Ӧû��Ŀ�������

[m,n]=size(X);
nl=length(Lowflag);
Z=zeros(m,n);

for i=1:n
    if find(Lowflag==i)  %��Ϊ ���� ָ��ʱ ���ô˺���
        XI=X(:,i);
        Xsum=sum((1./XI).^2);
        ZI=(1./XI)./(sqrt(Xsum));
        Z(:,i)=ZI;
    else    %�Ը���ָ����б任
        XI=X(:,i);
        Xsum=sum(XI.^2);
        ZI=XI./(sqrt(Xsum));
        Z(:,i)=ZI;
    end
end

       
end

