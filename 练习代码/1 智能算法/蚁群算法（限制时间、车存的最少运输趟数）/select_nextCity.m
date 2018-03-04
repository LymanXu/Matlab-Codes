function y = select_nextCity(J,visited,Eta,Tau,NC,NC_max)
%Ϊ���� i Ѱ����һ��Ҫ���ʵĳ���
Alpha=2;  % ��ʾ��Ϣ����Ҫ�ĳ̶�
Beta=1;   %��ʾ����ʽ���ӵ���Ҫ�̶�
q0=0.1;
q=q0+0.8*NC/NC_max;
jn=length(J);
for k=1:jn
    P(k)=(Tau(visited(end),J(k))^Alpha)*(Eta(visited(end),J(k))^Beta);
end

randp=rand();
if randp<q
P=P./sum(P);
index=find(P==max(P));
y=J(index(1));
else
    index=floor(jn*rand())+1;
    y=J(index);
end


end

