function Chrom = InitPop( NIND,N)
%��ʼ����Ⱥ
%NIND ��Ⱥ�Ĵ�С  N Ⱦɫ��ĳ��ȣ����еĸ�����
Chrom=zeros(NIND,N);
for i=1:NIND
    Chrom(i,:)=randperm(N);
end


end

