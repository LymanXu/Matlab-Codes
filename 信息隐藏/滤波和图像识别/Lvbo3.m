%% ������ֵ�˲�
clc,clear

%% 1 ����
I=imread('test.bmp');
I=rgb2gray(I);



%% ˮƽ��ֵ
[m,n]=size(I);
Y = zeros(m,n);
step = 7;
for i=1:m
    for j=1:n-step
        temp = I(i,j:j+step);
        s = sum(temp);
        h =s/step;
        Y(i,j)=h;
    end
end
for i=1:m
    for j =n-step+1:n
        Y(i,j)=I(i,j);
    end
end
Y=uint8(Y);

%% ˮƽ�˲�2
K1=filter2(fspecial('average',3),I)/255;

%����3*3��ֵ�˲�

K2=filter2(fspecial('average',5),I)/255;

%����5*5��ֵ�˲�

K3=filter2(fspecial('average',7),I)/255;
%% 3ȫ�־�ֵ
G=zeros(m,n);
for i=1:m   %������ƽ��
    s2 = sum(I(i,:));
    s2 =s2/n;
    for j=1:n
        G(i,j)=s2;
    end
end
%��������.��������
a=0.3;
for i=1:n
    s2=sum(I(:,i));
    s2=s2/m;
    for j=1:m
        if I(j,i)>s2
     %       G(j,i) = (1+a)*I(j,i);
        else
       %     G(j,i) = (1-a)*I(j,i);
        end
    end
    
end
G=uint8(G);

s=sum(sum(Y));
s=s/(m*n);

%% 2 ʹ����ֵ
I2=im2bw(Y,s/255);  
level=graythresh(Y);     %ȷ���Ҷ���ֵ
I3=im2bw(Y,level);   
%% ��ʾ
figure,imshow(I);title('ԭͼ��');
figure,imshow(I2);title('��ֵ(ƽ��)');
figure,imshow(I3);title('�Զ���ֵ');
figure,imshow(Y);title('��ֵ');
figure,imshow(G);title('����');
