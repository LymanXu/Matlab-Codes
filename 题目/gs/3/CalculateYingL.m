function [flagI,YingL] = CalculateYingL(wsita,jsita ,chi,t1)
%% ��̫��Ӱ�ӳ��ȵı仯,����wsita,jsita,ת����ľ�γ�ȣ���λ��
%% 1 ������ʼ��
H=3;%�˳�
%weiSita=39+54/60+26/3600; %γ�ȣ���γΪ��
weiSita=wsita;jingSita=jsita;
chiwei=chi;   %��γ��
%jingSita=116+23/60+29/3600;  %���ȣ�����Ϊ������γΪ��
%���㣬����γ���µ�����ʱ��

%HereT=12+(120-jingSita)*4/60;
%ʱ������T,ʱ������N
N=21;
T=t1;
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

