function [ new_chrom ] = chiasma( old_chrom )
%UNTITLED ���Ŵ��㷨Ϊ�����������еĽ����㷨
%   old_chromeΪ����,new_chromΪ�Ӵ�
[num,length]=size(old_chrom);
chrom=zeros(num,length);
new_chrom=zeros(num,length);
order=randperm(num);
for i=1:num
    chrom(i,:)=old_chrom(order(i),:);
end
p=0.8;

for i=1:2:num-1
    t=floor(rand*length)+1;
    if  t<length && rand()<p
        new_chrom(i:i+1,1:t)=chrom(i:i+1,1:t);
        %�������
        new_chrom(i,t+1:length)=chrom(i+1,t+1:length);
         new_chrom(i+1,t+1:length)=chrom(i,t+1:length);
    else
        %�����н���
        new_chrom(i:i+1,1:length)=chrom(i:i+1,1:length);
    end
end
end

