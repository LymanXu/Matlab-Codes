function valueOfcheng = chengFa2( wsita,jsita,chi )
%�ͷ�������������ͷ�ֵ
%ͨ����ʵ��̫���ǣ���ģ���̫����
weiSita=wsita;jingSita=jsita;
chiwei=chi; %��γ��
%����̫�������
FangWeiSita=zeros(2,1);
%T=[12.68;13.68];
T=[13.15,14.15];
for i=1:2
    t=T(i);
    tutc=t-8;
    tnew=tutc-12/180*jingSita;  %�˴��и�����������Ϊ��������+������ԭ���д���������������
    ITimeSita=15*(tnew-12);
    sinH=sin(weiSita/180*pi)*sin(chiwei/180*pi)+cos(weiSita/180*pi)*cos(chiwei/180*pi)*cos(ITimeSita/180*pi);
    hsita=asind(sinH);  %̫����
    FangWeiSita(i)=(sinH*sin(wsita/180*pi)-sin(chiwei/180*pi))/(cos(hsita/180*pi)*cos(wsita/180*pi));
    FangWeiSita(i)=acosd(FangWeiSita(i));
end
Dfwsita=FangWeiSita(2)-FangWeiSita(1);

%�����������ݵõ�ʵ�ʵ�Ӱ�ӱ仯��
%����2 Ϊ23.8447 ��3Ϊ17.1944
sita=23.8447;
sitaScope=[16.3347,18.0541];
%sitaScope=[22.65,25.04];
if Dfwsita<sitaScope(1)
    Dend=sitaScope(1)-Dfwsita;
elseif Dfwsita>sitaScope(2)
    Dend=Dfwsita-sitaScope(2);
else
    Dend=0;
end

valueOfcheng=Dend;
end