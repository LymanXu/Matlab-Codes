function [ToNew,PathEnd ] = huiYuanDian(J,visited,Eta,Tau,TabuI)
%��ԭ��
index=find(TabuI==0);
index=index-1;

index=index(1);
PathEnd=TabuI(index);

% �������� i �´� ���� Ҫȥ�ĳ���,�������ѡ��һ������ʱҪ�� 1 Ϊ���
     vl=length(visited);
     visited(1,vl)=1;
        to_visit=select_nextCity(J,visited,Eta,Tau);

ToNew=to_visit;

end

