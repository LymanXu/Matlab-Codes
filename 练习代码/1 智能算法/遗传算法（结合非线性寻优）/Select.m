function ret  = Select(individuals,sizepop)
%�������̶ķ�
%��������ÿһ����Ⱥ�е�Ⱦɫ�����ѡ���Խ��к���Ľ���ͱ���
% opts ��ѡ�񷽷���ѡ��
% ret  :����ѡ������Ⱥ
%%   !!!!!!!!����ָ��   �� ����ָ��
individuals.fitness=1./(individuals.fitness);
sumfitness=sum(individuals.fitness);
sumf=individuals.fitness./sumfitness;
index=[];
for i=1:sizepop   %ת sizepop ������
    pick=rand;
    while pick==0
        pick=rand;
    end
    for j=1:sizepop
        pick=pick-sumf(j);
        if pick<0
            index=[index j];
            break;  %Ѱ�����������Ⱦɫ�壬���ѡ��Ϊ j 
        end
    end
end
individuals.chrom=individuals.chrom(index,:);
%������ǰ��
%individuals.fitness=individuals.fitness(index);
individuals.fitness=1./individuals.fitness(index);
ret=individuals;

end

