function ret= Cross( pcross,lenchrom,old_chrom,sizepop )
%��������ɽ������
%pcross   �������
%lenchrom  Ⱦɫ��ĳ���
%UNTITLED ���Ŵ��㷨Ϊ�����������еĽ����㷨
%   old_chromeΪ����,new_chromΪ�Ӵ�
%[num,length]=size(old_chrom);
num=sizepop;length=lenchrom;

chrom=zeros(num,length);
%new_chrom=zeros(num,length);
order=randperm(num);
%�൱�����ѡ������Ⱦɫ��

for i=1:num
    chrom(i,:)=old_chrom(order(i),:);
end
new_chrom=chrom;
for i=1:2:num-1
    t=floor(rand*length)+1;
    pick=rand;
    while pick==0;
        pick=rand;
    end
    
    if pick<pcross
        %new_chrom(i:i+1,1:t)=chrom(i:i+1,1:t);
        place_1=zeros(1,length-t);  %����һ��Ҫ��������ڸ�����е�λ��
        place_2=zeros(1,length-t);  %�������Ҫ��������ڸ���һ�е�λ��
        %�ҵ���������λ��
        for j=t+1:length
            [~,col_1]=find(chrom(i+1,:)==chrom(i,j));%���� j ������ ��һ������ ��λ��Ϊ col_1
            [~,col_2]=find(chrom(i,:)==chrom(i+1,j));
            place_1(j-t)=col_1;
            place_2(j-t)=col_2;
        end
        rank_1=sort(place_1);  %�������λ�ý������򣬼������˽��棬�⼸�����򣬰�����һ���������⼸��������˳��
        rank_2=sort(place_2);
        %�������
        for j=t+1:length
            new_chrom(i,j)  = chrom(i+1,rank_1(j-t));
            new_chrom(i+1,j) = chrom(i,rank_2(j-t));
        end
    else
        %�����н���
        new_chrom(i:i+1,1:t)=chrom(i:i+1,1:t);
    end
end


ret=new_chrom;
        
    

end

