function ret = Mutation( pmutation,lenchrom,chrom,sizepop)
%�������
%!!!!!!!!!!!!!!!pop��ǰ��Ⱥ�Ľ���������������������Ϣ
for i=1:sizepop
    %���ѡ��һ��Ⱦɫ����б���
    pick=rand;
    while pick==0
        pick=rand;
    end
    %index=ceil(pick*sizepop);
    %������ʾ�������ѭ���Ƿ���б���
    pick=rand;
    if pick>pmutation
        continue;
    end
        %����λ��
        place=randperm(lenchrom);
    if place(1)>place(2)
        t=place(2);place(2)=place(1);place(1)=t;
    end
    %�������,���ߵ����������˳��
    newchrom=chrom(i,:);
    for j=place(1):place(2)
        newchrom(1,j)=chrom(i,place(1)+place(2)-j);
    end
    chrom(i,:)=newchrom(1,:);
      
end

ret=chrom;
end



