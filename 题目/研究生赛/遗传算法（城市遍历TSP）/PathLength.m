function len = PathLength( D,Chrom )
%��������·�߳��ȣ�ʱ�䣩
%Chrom  ·�� D�޸�Ϊʱ�����
[row,col]=size(D);
NIND=size(Chrom,1);  %��Ⱥ��С
len=zeros(NIND,1);
for i=1:NIND
    p=[Chrom(i,:) Chrom(i,1)];
    i1=p(1:end-1);
    i2=p(2:end);
    %�����·�ߵľ���
    len(i,1)=sum(D((i1-1)*col+i2));
end


end

