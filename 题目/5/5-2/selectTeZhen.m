%%  ���� Ƶ�����ַ�����ȷ��������
%ͨ��ͳ�ƺ�ѡ�����ȷ��maxL=109 12 9 8
%�Դ�ѡ�������������
maxL=109;
L=70005;
T=zeros(L,1);
for i=1:70005
    onel=length(char(sortCiKu(i,1)));
    T(i,1)=(onel/maxL)*newCif(i,1);
end

[newT,newTindex]=sort(T,'descend');  %����sortCiKu
fHe=sum(newT);
fHe=0.7*fHe;
sum=0;
for i=1:L
    sum=sum+newT(i);
    if sum>fHe
        disp(['�� ',num2str(i),' ��λ�õĴ�']);
        disp(['�ض���Ϣ��Ϊ��',num2str(newT(i))]);
        break;
    end
end
disp('���');

%��ȡ20 ��������
index=newTindex(1:100,1);
teZhenCi={};
for i=1:100
    teZhenCi(i,1)=sortCiKu(index(i));
    teZhenMessage(i,1)=newT(i,1);
end
    