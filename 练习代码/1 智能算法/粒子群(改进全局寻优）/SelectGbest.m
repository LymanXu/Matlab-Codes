function [newgbest,newgF] = SelectGbest(pbest,gbest,fvalue,gbestF)
%��ѡ��ȫ�����Ž�
K=4;
[sf,sfIndex]=sort(fvalue,'descend');
sumSF=sum(sf(1:K));
cSF=sf(1:K)/sumSF; %ÿ�����ӵ�Ȩ��ϵ��
sumf=cSF.*sf(1:K);  %��Ȩ����ۺ�������Ӧ��
newsumf=sum(sumf);
spbest=pbest(sfIndex(1:K),:);
if newsumf>gbestF  
    for i=1:K
    newg(i,:)=cSF(i)*spbest(i,:);  %�µ��ۺ�����λ��
    end
    newgbest=sum(newg);  %����֮�ͣ����Ϊ������
    
    newgF=newsumf;
else
   newgbest=gbest;
   newgF=gbestF;
end


end

