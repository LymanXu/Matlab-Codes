% ����֤�е�0 ��λinf���˶Խ��ߵ� 
for i=1:58
    for j=1:58
        if i~=j && Dis2(i,j)==0
            Dis2(i,j)=inf;
        end
    end
end

%�滻 Inf Ϊʵ��
for i=1:58
    for j=1:58
        if dEnd(i,j)==inf
            dEnd(i,j)=10000;
        end
    end
end

%�����·��
W=sparse(Dis1);
dEnd=graphallshortestpaths(W);
