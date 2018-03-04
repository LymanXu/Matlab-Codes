
function [distance,path ] = dijkstral(A,s,e )
%function [distance,path]=dijkstra1(A,s,e)
% [DISTANCE,PATH]=DIJKSTRA(A,S,E)
% returns the distance and path between the start node and the end node.
%
% A: adjcent matrix
% s: start node
% e: end node
% initialize
n=size(A,1);        % node number
D=A(s,:);           % distance vector ��ԭ�㵽������������ľ���
path=[];            % path vector
visit=ones(1,n);    % node visibility�Ƿ���� U
visit(s)=0;         % source node is unvisible
parent=zeros(1,n);  % parent node
% the shortest distance
for i=1:n-1         % BlueSet has n-1 nodesÿ��ѭ������һ����
    temp=zeros(1,n);
    count=0;
    for j=1:n
        if visit(j) %û���� U ��
            temp=[temp(1:count) D(j)];  %��� ���β��� ��� ����������ľ���
        else
            temp=[temp(1:count) inf];   % �ö���ͬ�� U �в����ڿ��ǣ����Ծ��� ΪInf
        end
        count=count+1;
    end
    [value,index]=min(temp);  %ѡȡ s ���˾�����̵� ĳ�� index����λ��
    j=index; visit(j)=0;      %���õ���� U ��
    for k=1:n              %�������·��
        if D(k)>D(j)+A(j,k)
            D(k)=D(j)+A(j,k);
            parent(k)=j;   %��¼ K��ǰ�ö���Ϊ  j
        end
    end
end
distance=D(e);
% the shortest distance path
if parent(e)==0, return; end  %�յ� û��ǰ�ö����� ����
path=zeros(1,2*n);      % path preallocation
t=e; path(1)=t; count=1;  
while t~=s && t>0   % �ӽ������� ���� ����ʼ��
    p=parent(t);
    path=[p path(1:count)];  %���Ͻ�path ��ǰ���� 
    t=p; count=count+1;
end

%��֤ ���· 
if count>=2*n, error(['The path preallocation length is too short.',...
        'Please redefine path preallocation parameter.']);
end
path(1)=s;  %û��Ҫ
path=path(1:count);

end

