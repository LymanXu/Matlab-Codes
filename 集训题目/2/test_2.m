x=-10:0.1:10;
y=(1/sqrt(2*pi)*exp(x.^2/(-2)));
s=-2*pi:pi/40:2*pi;
p=sin(2*s);
subplot(1,2,1)
plot(x,y),title('��׼��̬�ֲ������ܶ�����')
subplot(1,2,2)
polar(s,p),title('��Ҷõ������')
