function T = calculateTime( iChrom,d,v )
%����һ�Ҵ�������������Ҫ��ʱ��
oneChrom=iChrom;
oneL=length(oneChrom);
t=0;
for i=1:oneL-1
    snode=oneChrom(1,i);enode=oneChrom(1,i+1);
    DL=d(snode,enode);
    It=DL/v;
    t=t+It;
end
T=t;

end

