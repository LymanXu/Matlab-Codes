function newchrom= tiaoZhengChrom( oldchrom)
%����·�ߣ���֤�����յ��Ϊ 1����ʡ��
[num,sizeL]=size(oldchrom);

for i=1:num
    index=find(oldchrom(i,:)==1);
    thuan=oldchrom(i,1);
    oldchrom(i,1)=1;
    oldchrom(i,index)=thuan;
end
newchrom=oldchrom;
end

