function valueOfcheng = chengFa2( wsita,jsita )
%�ͷ�������������ͷ�ֵ
%ͨ����ʵ��̫���ǣ���ģ���̫����
weiSita=wsita;jingSita=jsita;
chiwei=10; %��γ��
%����̫�������
FangWeiSita=zeros(2,1);
T=[14.7;15.7];
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
sita=7.08;
sitaScope=[6.73,7.43];
if Dfwsita<sitaScope(1)
    Dend=sitaScope(1)-Dfwsita;
elseif Dfwsita>sitaScope(2)
    Dend=Dfwsita-sitaScope(2);
else
    Dend=0;
end

valueOfcheng=Dend;
end