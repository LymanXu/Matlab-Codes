function [m, N ,d ,C] = input_C(Aplot,xuQiu,n,M )
%������������꣬���ؾ������
%N=input('������еĹ�ģ��');
N=n;

C=zeros(N,2);
d=inf.*ones(N,N);
%C=input('����������е����꣨N��2�У���');
 %XuQiu=input('����ÿ����������������');
C=Aplot;
%m=input('�������ϵ�������');
m=M;
for i=1:N
    for j=1:i
       if i~=j
        d(i,j)=sqrt((C(i,1)-C(j,1))^2+(C(i,2)-C(j,2))^2);
       else
        d(i,j)=eps;      %i=jʱ�����㣬Ӧ��Ϊ0�����������������Ҫȡ��������eps��������Ծ��ȣ���ʾ 
       end
       d(j,i)=d(i,j);  %Ϊ�Գƾ���
    end
end 
%disp(D);

end

