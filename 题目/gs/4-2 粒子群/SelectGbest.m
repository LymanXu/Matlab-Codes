function [newgbest,newgF] = SelectGbest(pbest,gbest,fvalue,gbestF,Pscope)
%��ѡ��ȫ�����Ž�
%%  ����������������������2

%K=4;
%[~,pn]=size(pbest);
[sf,sfIndex]=sort(fvalue,'descend');
%sumSF=sum(sf(1:K));%����һ����ֵ
%cSF=sf(1:K)/sumSF; %ÿ�����ӵ�Ȩ��ϵ��
%sumf=cSF.*sf(1:K);  %��Ȩ����ۺ�������Ӧ��
%newsumf=sum(sumf);
%spbest=pbest(sfIndex(1:K),:);
%newg=zeros(K,pn);
%if newsumf>gbestF  
 %   for i=1:K
  %  newg(i,:)=cSF(i)*spbest(i,:);  %�µ��ۺ�����λ��
   % end
    %newgbest=sum(newg);  %����֮�ͣ����Ϊ������
    %�˴��������µ�λ�ø��£�fitness
   % newgbest= pInScope( newgbest,Pscope);
   % newgF=fitness(newgbest);
if sf(1)>gbestF 
    newgbest=pbest(sfIndex(1),:);
    newgF=fvalue(sfIndex(1),1);
else
   newgbest=gbest;
   newgF=gbestF;
end


end

