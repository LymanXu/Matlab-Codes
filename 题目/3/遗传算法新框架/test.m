function flag= test( lenchrom,bound,oneChrom)
%�ж�Ⱦɫ���Ƿ����Ҫ��
L=length(lenchrom);
for i=1:L
    if oneChrom(1,i)<bound(i,1) || oneChrom(1,i)>bound(i,2)
        flag=0;
        break;
    end
end
if i==L
    flag=1;
end


end

