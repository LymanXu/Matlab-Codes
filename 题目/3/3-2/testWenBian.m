%% 1 ��ʼ������  ��5 ��
k=[0.1675;1.74;0.82;0.03;1.41;0.95];
c=[0.921;0.84;0.19;5.346;0.78;0.73];
p=[1.092;2.5;1.5;0.025;2.19;2.02];
ChaX=1:12;
ChaY=[-1.6 1.5 5.2 8.4 12.3 15.9 15.7 14.7 12.9 8.7 2.9 -1.2];
%D=[2;4;6;8;10];
D=[20;50;100;110;510];
%ʱ�䲽��Ϊ t ���벽��Ϊ h
t=0.001;
h=10;
%�����¶� �� �����¶�
%wenq=10;wend=-10;
wenq=1.5;wend=-15;
%�������Ϊ m ,ʱ�����Ϊ n
%m=floor(h5/h);
n=1000;
%��¼�����������������ڵĸ������
Tg=zeros(4,2);
xu=zeros(5,2);xu(1,1)=2;
for i=1:4
Tg(i,1)=floor(D(i)/h);
Tg(i,2)=Tg(i,1)+1;
xu(i,2)=Tg(i,1)-1;
xu(i+1,1)=Tg(i,2)+1;
end
%�����ܸ���Ϊ m
 m=floor(D(5)/h);
xu(5,2)=m-1;
%��ʼ����¼�¶ȵ�����
wen=zeros(m,n);
%�Բ�ֵ������ʼ��ÿ��ʱ��㻷���¶ȵ��¶�
%%       ���·� ��� jwp���±�� ���·�--- -1 ������������������������������������
jwq=6;
for ht=2:n
   dt=ht*t;
   T=jwq+dt;
   %���ú�������¶�ֵ
   wen(1,ht)=calcultWen(ChaX,ChaY,T);
end
%wen(1,1)=wenq;wen(m,:)=wend;
dwen=(wenq-wend)/m;
%% ��һ�ʵó���ƽ��״̬ !!!!����������������������
wen(:,1)=Eping;
%for i=2:m
 %   wen(i,1)=wenq-dwen*i;
%end
wen(m,:)=wend;
f=(k./(c.*p)).*(t/(h^2));
%% 2 ͨ�����ϸ��¸����е�ֵ��������ƽ��״̬
for i=2:n   %ÿһ��ʱ����һ��
    disp(['ʱ��ǰ�� ',num2str(i-1),' ��']);
       for ki=1:5
           for j=xu(ki,1):xu(ki,2)
              wen(j,i)=f(ki)*(wen(j+1,i-1)+wen(j-1,i-1))+(1-2*f(ki))*wen(j,i-1);
           end
       end
        %���������
        for ik=1:4  %4 ��������
             wen(Tg(ik,1),i)=(k(ik)*wen(Tg(ik,1)-1,i)+k(ik+1)*wen(Tg(ik,2)+1,i))/(k(ik)+k(ik+1));
             wen(Tg(ik,2),i)=wen(Tg(ik,1),i);
        end
        
  
end
%% 2 ���¶�Ϊ 0 �����
index=find(wen(:,n)<0);
index=index(1);
zeroD=h*index;
%disp(['�¶�Ϊ 0 �����Ϊ��',num2str(zeroD)]); ����������������������������¼ 2
%disp(num2str(wen(:,n)));
WenPing=wen(:,n);               % ����������������¼ 1
WenZero=zeroD;
%figure(jwq);
%%        ������������������������������������������������������������������������
figure(1);
detalgy=0:-1:-510;detalgx=6:0.1:7;imagesc(detalgx,detalgy,wen);xlabel('ʱ��/��');ylabel('�������/����');
      
figure(2);
plot(1:51,wen(:,n),'-');xlabel('�������/����');ylabel('�¶�/��');