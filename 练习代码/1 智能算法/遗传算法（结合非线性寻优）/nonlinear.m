function ret = nonlinear(chrom,sizepop)
%����MATLAB�е�fmincon�������з�����Ѱ��
for i=1:sizepop
    x=fmincon(@fun,chrom(i,:),[],[],[],[],[10 20 30 5],[30 40 70 20]);
    ret(i,:)=x';
end
end

