function new_chrom=select(old_chrom,chrom,fitness)
%��������ÿһ����Ⱥ�е�Ⱦɫ�����ѡ���ѽ��к���Ľ���ͱ���
[num,~]=size(chrom);
new_chrom=old_chrom;
for i=1:num  
    if(fitness(i,1)>fitness(i,2))  %�ϴ�<
        new_chrom(i,:)=chrom(i,:);
    end
end
end