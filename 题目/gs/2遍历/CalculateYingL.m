function [flagI,YingL] = CalculateYingL(wsita,jsita )
%% ��̫��Ӱ�ӳ��ȵı仯,����wsita,jsita,ת����ľ�γ�ȣ���λ��
%% 1 ������ʼ��
H=3;%�˳�
%weiSita=39+54/60+26/3600; %γ�ȣ���γΪ��
weiSita=wsita;jingSita=jsita;
chiwei=10;   %��γ��
%jingSita=116+23/60+29/3600;  %���ȣ�����Ϊ������γΪ��
%���㣬����γ���µ�����ʱ��

%HereT=12+(120-jingSita)*4/60;
%ʱ������T,ʱ������N
N=21;
T=[14.7000
   14.7500
   14.8000
   14.8500
   14.9000
   14.9500
   15.0000
   15.0500
   15.1000
   15.1500
   15.2000
   15.2500
   15.3000
   15.3500
   15.4000
   15.4500
   15.5000
   15.5500
   15.6000
   15.6500
   15.7000];
Tutc=T-8;
%%  ����������1
HereT=Tutc-24/360*jingSita;
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

