clc,clear;
str=input('����Ҫ���ҵ��ַ�����');
S=input('����Ҫ���ҵ��ַ���');
snum=length(str);
num=length(S);
f=zeros(1,num);
for i=1:num   %ÿѭ��һ�β���һ���ַ��Ĵ���λ��
    st=S(i);
    fplace=[];
    for j=1:snum  %�������е��ַ�
        if str(j)==st
            f(i)=f(i)+1;
            fplace=[fplace,j];
        end
    end
    disp(['�ַ� ',st]);
    disp(['���ֵĴ���Ϊ��',num2str(f(i))]);
    disp('���ֵ�λ������Ϊ��'),disp(fplace);
end

            
            