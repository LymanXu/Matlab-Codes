function [flagI,YingL] = CalculateYingL(wsita,jsita,chi )
%% ��̫��Ӱ�ӳ��ȵı仯,����wsita,jsita,ת����ľ�γ�ȣ���λ��
%% 1 ������ʼ��
H=2;%�˳�
%weiSita=39+54/60+26/3600; %γ�ȣ���γΪ��
weiSita=wsita;jingSita=jsita;
chiwei=chi;   %��γ��
%jingSita=116+23/60+29/3600;  %���ȣ�����Ϊ������γΪ��
%���㣬����γ���µ�����ʱ��

%HereT=12+(120-jingSita)*4/60;
%ʱ������T,ʱ������N
N=14;
T=[8.9000
    8.9500
    9.0000
    9.0500
    9.1000
    9.1500
    9.2000
    9.2500
    9.3000
    9.3500
    9.4000
    9.4500
    9.5000
    9.5500];
Tutc=T-8;
%%  ����������1
HereT=Tutc-24/360*jingSita;%%�޸ģ�������
HSita=zeros(N,1); %��¼ÿ��ʱ�̵��̫���߶Ƚ�
YingL=zeros(N,1);  %��¼ÿ��ʱ�̵��Ӱ�ӳ���
flag0=1;

%% 2 ��Ӱ������
for i=1:N %ÿ�δ���һ��ʱ���
   % t=T(i,1);
    ITimeSita=(HereT(i)-12)*15;  %ʱ���
    sinH=sin(weiSita/180*pi)*sin(chiwei/180*pi)+cos(weiSita/180*pi)*cos(chiwei/180*pi)*cos(ITimeSita/180*pi);
    if sinH<0
        flag0=0;
        YingL=[];
        break;
    end
        
    hsita=asind(sinH);  %̫����
    HSita(i,1)=hsita; 
    yl=H/tan(hsita/180*pi);  %Ӱ��
    YingL(i,1)=yl;
end
flagI=flag0;

end

