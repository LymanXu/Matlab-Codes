%%�ȴ���������

%% 1 ��ʼ������  ��5 ��
k=[0.1675;1.74;0.82;0.03;1.41;0.95];
c=[0.921;0.84;0.19;5.346;0.78;0.73];
p=[1.092;2.5;1.5;0.025;2.19;2.02];
h0=0;
D=[29;67;125;145;540];
%ʱ�䲽��Ϊ t ���벽��Ϊ h
t=0.001; h=10;
%�����¶� �� �����¶�
wenq=15.7;wend=-15;
%�������Ϊ m ,ʱ�����Ϊ n
%m=floor(h5/h);
n=10000;
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
wen(1,:)=wenq;wen(m,:)=wend;
dwen=(wenq-wend)/m;
for i=2:m
   wen(i,1)=wenq-dwen*i;
end

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
disp(['�¶�Ϊ 0 �����Ϊ��',num2str(zeroD)]); %����������������������������¼ 2
disp(num2str(wen(:,n)));
figure(1);
detalgy=0:-0.1:-80;detalgx=0:0.1:1;imagesc(detalgx,detalgy,wen);xlabel('ʱ��/��');ylabel('�������/����');
      
figure(2);
plot(1:54,wen(:,n),'-');
        



















