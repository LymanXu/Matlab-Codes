clc,clear
%%
I=imread('test.bmp');
I=rgb2gray(I);
H=fspecial('gaussian',[4,4],0.2);
WImage3=imfilter(I,H);
figure,imshow(WImage3,[]);
title('��˹��ͨ�˲���ͼ��');

% ��ֵ�˲�ƽ��

J = medfilt2(I);

figure,imshow(J,[]);

title('��ֵ�˲�ƽ��');

K1=filter2(fspecial('average',3),I)/255;

%����3*3��ֵ�˲�

K2=filter2(fspecial('average',5),I)/255;

%����5*5��ֵ�˲�

K3=filter2(fspecial('average',7),I)/255;

%����7*7��ֵ�˲�

figure,imshow(K1)

figure,imshow(K2)

figure,imshow(K3)
