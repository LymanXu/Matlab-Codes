%% ����̫��Ӱ�ӳ��ȵı仯
%% 1 ������ʼ��
H=3;%�˳�
weiSita=39+54/60+26/3600; %γ�ȣ���γΪ��
chiwei=-10-50/60;   %��γ��
jingSita=116+23/60+29/3600;  %���ȣ�����Ϊ��
%���㣬����γ���µ�����ʱ��
HereT=12+(3+36/60+31/3600)*4/60;
%ʱ������T,ʱ������N
N=121;
T=ChuT;
HSita=zeros(N,1); %��¼ÿ��ʱ�̵��̫���߶Ƚ�
YingL=zeros(N,1);  %��¼ÿ��ʱ�̵��Ӱ�ӳ���

%% 2 ��Ӱ������
for i=1:N %ÿ�δ���һ��ʱ���
    t=T(i,1);
    ITimeSita=(t-HereT)*15;  %ʱ���
    sinH=sin(weiSita/180*pi)*sin(chiwei/180*pi)+cos(weiSita/180*pi)*cos(chiwei/180*pi)*cos(ITimeSita/180*pi);
    hsita=asind(sinH);  %̫����
    HSita(i,1)=hsita; 
    yl=3/tan(hsita/180*pi);  %Ӱ��
    YingL(i,1)=yl;
end

%% 3 ��ʾ���
figure    %Ӱ���仯
plot(T,YingL);
xlabel('ʱ��/Сʱ'),ylabel('Ӱ��/��');
%axis[];
figure  %̫���Ǳ仯
plot(T,HSita);
xlabel('ʱ��/Сʱ'),ylabel('̫���߶Ƚ�/��');