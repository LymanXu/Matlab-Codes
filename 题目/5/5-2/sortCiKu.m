%% ͨ������������Ƶ���ͳ��ȣ�ȷ���ض�λ��
Fsum=Cif;
[newCif,newIndex]=sort(Fsum,'descend');
L=length(newCif);
sortCiKu={};sortCiN=[];
%������������¼
oldl=2;
for i=1:L
    sortCiKu(i,1)=CiKu(newIndex(i));
    newl=length(char(sortCiKu(i,1)));
    if newl>oldl
        oldl=newl;
        disp(oldl);
    end
    sortCiN(i,1)=CipepleN(newIndex(i));
end
%fHe=sum(Fsum);
%fHe=0.7*fHe;
%sum=0;
%for i=1:L
 %   sum=sum+newCif(i);
  %  if sum>fHe
   %     disp(['�� ',num2str(i),' ��λ�õĴ�']);
    %    disp(['�ض�Ƶ��Ϊ��',num2str(newCif(i))]);
     %   break;
    %end
%end
disp('���');
        