%Prim�㷨����С������
%������������м���������˳��Ϊ��
 %     1     4     3     2     5     6

%��Ӧÿ�����е�ǰ�ö���Ϊ��
 %    0     1     1     3     1     5
clc,clear;
n=input('������еĸ�����');
road=input('����������еľ������:');
%��ʼ�� U TE,
U=zeros(1,n);
U(1)=1;
TE=zeros(1,n); %��¼����U �����ǰ�ö���

lowl=ones(1,n); %��¼ V �е��� U ����̾���,�ڶ��м�¼�� U �����ӵĶ���
lowl=road(1,:);
lowl(1)=inf;
lowlv=ones(1,n); %��¼U��ĵ㵽U��̾��� ��ӦU�еĶ���
%lowe(2,n)=ones(1,n);

lowflag=zeros(1,n);  %��¼�����Ƿ���뵽 U �� 0û���� 1�Ѽ���
lowflag(1)=1;


for i=2:n %ÿ��ѭ���� U �м���һ������
    %Ѱ�� ��U ��������ĵ�
    inde=find(lowl==min(lowl));
    index=inde(1);
    %���� ����U ,�����õ��ǰ�ö������TE
    U(i)=index;
    TE(i)=lowlv(index);
    lowl(index)=inf;
    lowflag(1,index)=1;
    %��鲢���¾���
    for j=2:n
        if lowflag(1,j)==0 && lowl(1,j)>road(index,j)
            lowl(j)=road(index,j);
            lowlv(j)=index;   %���� j ��ǰ�ö���
        end
    end
end

disp('�������м���������˳��Ϊ��');disp(U);
disp('��Ӧÿ�����е�ǰ�ö���Ϊ��');disp(TE);

    
    
    
    