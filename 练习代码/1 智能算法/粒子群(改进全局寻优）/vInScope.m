function V= vInScope(V,Vscope)
%��֤�ٶȲ�Խ��
[m,n]=size(V);
for i=1:m
    for j=1:n
        if V(i,j)<Vscope(2,j)  %С�ڶ�Ӧά���ٶȵ�����
            V(i,j)=Vscope(2,j);
        elseif V(i,j)>Vscope(1,j)
            V(i,j)=Vscope(1,j);
        end
    end
end

end

