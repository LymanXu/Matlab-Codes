function y = select_nextCity(J,visited,Eta,Tau)
%Ϊ���� i Ѱ����һ��Ҫ���ʵĳ���
Alpha=0.8;  % ��ʾ��Ϣ����Ҫ�ĳ̶�
Beta=5;   %��ʾ����ʽ���ӵ���Ҫ�̶�
jn=length(J);
for k=1:jn
    P(k)=(Tau(visited(end),J(k))^Alpha)*(Eta(visited(end),J(k))^Beta);
end

P=P./sum(P);
index=find(P==max(P));
y=J(index(1));


end

