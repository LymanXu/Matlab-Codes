function [] = plotDong(wen)
%% ֻ�ܾ����ʾ�¶����Ա仯���޲����Ŀռ��¶ȷֲ�
%���벻ͬ���ڵ��¶�ƽ�����¶ȷֲ����������ڼ��ڱ仯ͼ��ĸ���
[m,n]=size(wen);
for i=1:n  %ÿһ�л�һ��ͼ�����θ���
    W=wen(:,i);
    meshThree(W);
    pause(1);
    hold off;
    drawnow;
end


end

