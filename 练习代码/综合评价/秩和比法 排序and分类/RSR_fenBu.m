function [RSR2,Probit] = RSR_fenBu( RSR)
%����RSR�ķֲ�

n=length(RSR);
%ֱ���Ѵ�����ȫ��Ԫ��
num=1;
RI=RSR;
RSR2=[];
R_s=[];
while num<n
    numSum=0;
    index=find(RI==min(RI));
    RSR2=[RSR2;min(RI)];
    il=length(index);
    %���Ѽ�¼�����ݱ�Ϊ���
    for j=1:il
        numSum=numSum+num;
        num=num+1;
        RI(index(j))=inf;
    end
    %�ۺϰٷֱ�
    numsum_p=numSum/il;
    numsum_p=numsum_p/n;  %�����潫ʽ�����г���û��������
    R_s=[R_s;numsum_p];  
end
%�������һ�� �ٷֱ� PPT�ϼǵ�Ϊ 97.5
RSR2=[RSR2;min(RI)];
R_s=[R_s;0.975];
disp('���յ�RSR2Ϊ��');disp(RSR2);
disp('��Ӧ�� R ��ƽ��ֵΪ��');disp(R_s);


end

