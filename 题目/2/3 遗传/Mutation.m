function new_chrome= Mutation(chrom,Prob)
%����
[num,length]=size(chrom);
new_chrome=chrom;
for i=1:num
    rate=rand;
    %���ʾ�����ѭ���Ƿ����
    if rate>Prob
        continue;
    end
    %ȷ�����������(place(1),place(2))
    place=randperm(length);
    if place(1)>place(2)
        t=place(2);place(2)=place(1);place(1)=t;
    end
    %�������,���ߵ����������˳��
    for j=place(1):place(2)
        new_chrome(i,j)=chrom(i,place(1)+place(2)-j);
    end
end
end





