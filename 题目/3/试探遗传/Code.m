function ret = Code( lenchrom,bound)
%��Ⱦɫ����б���
L=length(lenchrom);
oneChrom=zeros(1,L);
for i=1:L
    pick=rand;
    x=pick*(bound(i,2)-bound(i,1));
    oneChrom(1,i)=bound(i,1)+x;
end
ret=oneChrom;

end

