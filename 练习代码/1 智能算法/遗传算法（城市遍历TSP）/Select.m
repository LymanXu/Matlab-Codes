function SelCh = Select( Chrom,FitnV,GGAP )
%GGAP ѡ�����  SelCh ��ѡ��ĸ���  
NIND=size(Chrom,1);
NSel=max(floor(NIND*GGAP+0.5),2);
%NSel����ѡ��ĸ�����ChrIx�µ���Ⱥ�и�������
ChrIx=Sus(FitnV,NSel);
SelCh=Chrom(ChrIx,:);

end

