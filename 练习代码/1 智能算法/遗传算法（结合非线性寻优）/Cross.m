function ret= Cross( pcross,lenchrom,chrom,sizepop,bound )
%��������ɽ������
%pcross   �������
%lenchrom  Ⱦɫ��ĳ���
for i=1:sizepop           %�Ƿ���н���������ɽ�����ʾ���
    %���ѡ������Ⱦɫ����н���
    pick=rand(1,2);
    while prod(pick)==0
        pick=rand(1,2);
    end
    index=ceil(pick.*sizepop);
    %������ʾ����Ƿ���н���
    pick=rand;
    while pick==0
        pick=rand;
    end
    if pick>pcross
        continue;
    end
    flag=0;
    while flag==0
        %���ѡ�񽻲��λ��
        pick=rand;
        while pick==0
            pick=rand;
        end
        pos=ceil(pick.*sum(lenchrom));%���ѡ����н����λ��
        pick=rand;   %���濪ʼ
        v1=chrom(index(1),pos);
        v2=chrom(index(2),pos);
        chrom(index(1),pos)=pick*v2+(1-pick)*v1;
        chrom(index(2),pos)=pick*v1+(1-pick)*v2;
        %flag1=test(lenchrom,bound,chrom(index(1),:),fcode);
        %flag2=test(lenchrom,bound,chrom(index(2),:),fcode);
        flag1=test(lenchrom,bound,chrom(index(1),:));
        flag2=test(lenchrom,bound,chrom(index(2),:));
       
        if flag1*flag2==0
            flag=0;
        else
            flag=1;   %�������Ⱦɫ�岻�Ƕ����еģ���������½���
        end
    end
end
ret=chrom;
        
    

end

