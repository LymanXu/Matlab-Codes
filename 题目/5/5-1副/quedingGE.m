%% ͳ�Ƹ���������Ƶ����ȷ���ض�Ƶ��
%Fsum=[];
sF=sort(Fsum,'descend');
L=length(sF);
fHe=sum(sF);
fHe=0.9*fHe;
sum=0;
for i=1:L
    sum=sum+sF(i);
    if sum>fHe
        disp(['�� ',num2str(i),' ��λ�õĴ�']);
        disp(['�ض�Ƶ��Ϊ��',num2str(sF(i))]);
        break;
    end
end
disp('���');
        