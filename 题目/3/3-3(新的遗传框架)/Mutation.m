function new_chrome= Mutation(chrom,Prob,H)
%����
[num,length]=size(chrom);
new_chrome=chrom;
for i=1:num
    rate=rand;
    %���ʾ�����ѭ���Ƿ����
    if rate>Prob
        continue;
    end
    %�������
    index=floor(rand()*length)+1; %����λ��
    new_chrome(i,index)=rand()*H(index,2)+H(index,1);
end
end





