function chrom = get_chrom(num,length )
%��ʼ�����˳��
chrom=zeros(num,length);
for i=1:num
    chrom(i,:)=randperm(length);
end
end

