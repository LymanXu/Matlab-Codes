jizhi=[];
k=1;
for i=3:179
    for j=3:359
        for chi=3:46
        %a=[Fitness(i-1,j+1),Fitness(i,j+1),Fitness(i+1,j+1),Fitness(i-1,j),Fitness(i+1,j),Fitness(i-1,j-1),Fitness(i,j-1),Fitness(i+1,j-1)];
        a=Fitness1(i-2:i+2,j-2:j+2,chi-2:chi+2);
        aa=max(a(:));%��Χ�˸�������ֵ
        if Fitness1(i,j,chi)==aa&&Fitness1(i,j,chi)~=0%�ж��Ƿ�Ϊ����ֵ
            jizhi(k,1)=i;%γ����Ϣ
            jizhi(k,2)=j;%������Ϣ
            jizhi(k,3)=chi;
            jizhi(k,4)=Fitness1(i,j,chi);%��ֵ
            k=k+1;
        end
        end
    end
end
for k=1:length(jizhi)
jizhi(k,1)=90-jizhi(k,1)+1;%����Ϊγ��
jizhi(k,2)=-180+jizhi(k,2)-1;%����Ϊ����
%jizhi(k,2)=180-jizhi(k,1)+1;
jizhi(k,3)=jizhi(k,3)-24.5;
end
