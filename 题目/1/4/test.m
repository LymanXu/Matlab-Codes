%�۸�� 2.4  
clc,clear;
% 1 ͨ��ƽ������ �� c1 c2 ��30t,3.14��
a=1/0.8;
b=1/0.7;
xp=30;
yp=3.14;
ylow=2.4;
busum=yp-ylow;
c1=yp/(xp^a);
c2=yp*xp^b;
% ��Ӧ y=c1*(x^a);   ����  y=c2/(x^b);
dieN=60;
pplot=zeros(2,dieN);
pplot(1,1)=xp;    %����
pplot(2,1)=yp; %�۸�
yandbu=zeros(3,dieN);
% 2 ���� 5�ε��� �ı�20%
for i=0:dieN
    % ��λ
    %�ı�y ,�����㹩Ӧ����
    %yg=ylow+busum*0.2*i;
    yi=i+1;
    yp=0.8*pplot(2,yi)+0.2*ylow;
    xp=pplot(1,yi);
    cg1=yp/(xp^a);
    %���µĹ�Ӧ���ߵĽ��� cg1 Ϊ��Ӧ����ϵ��
    [px,py]=selectjiaodian(cg1,c2,a,b);
    %����ƽ��㼯
    pplot(1,yi+1)=px;
    pplot(2,yi+1)=py;
    dy=py-ylow;
    dy3=yp-py;
    yandbu(1,yi)=py;  %�۸�
    yandbu(2,yi)=dy;  %��Ӧ�۸�Ĳ���
    %yandbu(3,yi)=dy3;
    disp(['�� ',num2str(i+1),' �ε���']);
end

%��ͼ


    

