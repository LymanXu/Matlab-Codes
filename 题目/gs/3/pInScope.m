function position= pInScope( position,Pscope)
%��֤����λ�ò�Խ��
[m,n]=size(position);
for i=1:m
    for j=1:n
        if position(i,j)<Pscope(2,j)  %С�ڶ�Ӧά���ٶȵ�����
            position(i,j)=Pscope(2,j);
        elseif position(i,j)>Pscope(1,j)
            position(i,j)=Pscope(1,j);
        end
    end
end


end

