%% �ı�����¶ȣ���ƽ���¶ȷֲ�
WenQ=[-1.6 1.5 5.2 8.4 12.3 15.9 15.7 14.7 12.9 8.7 2.9 -1.2];
WenD=-15;
Dd=[20;50;100;110;510];
h=10;
%����
m=floor(Dd(5)/h);
J=length(WenQ);

WenP=zeros(m,J);
WenZ=zeros(1,J);
FenHSum=zeros(4,12);
for jWq=1:J  %ÿ��һ���·�
    disp(['�� ',num2str(jWq),'����']);
    Wenq=WenQ(jWq);
    Wend=WenD;
    [WenPing,WenZero,FenH]=wenfen(Dd,Wenq,Wend,h,jWq);
    WenP(:,jWq)=WenPing;
    WenZ(1,jWq)=WenZero;
    FenHSum(:,jWq)=FenH;
   %������ά�¶ȴ���ͼ
   %figure(jWq);
   %meshThree(WenPing);
end
    