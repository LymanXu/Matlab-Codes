clc,clear;
liu=zeros(9,9);
% ��������Ϊ�ϰ벿��
for i=1:8
    for j=(i+1):9
        if rand()<0.8
            liu(i,j)=ceil(9*rand());
        else
            liu(i,j)=0;
        end
    end
    
end
disp('�����������������Ϊ��');disp(liu);

%��������Lingo�����Ż����