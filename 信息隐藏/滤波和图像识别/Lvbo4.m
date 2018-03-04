%%
clc,clear
%% 1 ����
I=imread('test.bmp');
I=rgb2gray(I);
[m,n]=size(I);
%% 2 ����ƽ������
step=200;
k=1.5;
G=zeros(m,n);
for i=1:m   
    for j=1:n
        if j<n-step
            %���
            s1=sum(I(i,j:j+step))/(step+1);
        else
            %��ǰ
            s1=sum(I(i,j-step:j))/(step+1);
        end
            
        G(i,j)=s1*k;
    end
end
%% 3 ��������.��������k
Gs=sum(sum(G))/(m*n);
G1=zeros(m,n);
k=3;
step=2;  %���������ȵ�L-1��Ӧ��L-step+1��
for i=1:m
    for j=1:n
        if i<m-step
            %���Ƚ�
            temph=G(i,j)-G(i:i+step,j);
            s=max(temph);
            if s<0
                s=0;
            end
            G1(i,j)=s*k;
        else
            %��ǰ�Ƚ�
            temph=G(i,j)-G(i-step:i,j);
            s=max(temph);
             if s<0
                s=0;
            end
            G1(i,j)=s*k;
        end
    end
end
%% 4 �Ҷ�ͼ����ֵ������ʾ
G1=uint8(G1);
level=graythresh(G1);     %ȷ���Ҷ���ֵ
I3=im2bw(G1,level); 
I3=~I3;

%% 5 ����
TouYing =zeros(m,1);
for i=1:m
    TouYing(i,1) = sum(I3(i,:));
end
indexs=find(TouYing<(sum(TouYing)/(m*2)));
L=length(indexs);
sumL=0;
count=0;
for i=1:L-1
    if indexs(i+1)-indexs(i)>10
        count=count+1;
        sumL=sumL+indexs(i+1)-indexs(i);
    end
end
sumL=sumL/count;
disp(['ÿ��ƽ��ռ��ֽ�ų��ȵ�(����):',num2str(sumL/m)]);
%% 5 ��ͼ
figure,imshow(I);title('ԭͼ��');
G=uint8(G);
figure,imshow(G);title('����ƽ��');
figure,imshow(I3);title('�������죨�����');
