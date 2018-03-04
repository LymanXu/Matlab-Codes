clc,clear

%% ����ͼ��
I=imread('test.bmp');
%I = imread(fineName);
I=rgb2gray(I);
figure(1);

subplot(2,2,1);

imshow(I);

title('ԭͼ��');

%% ֱ��ͼ���⻯

m = 16;

H = histeq(I,m);

subplot(222);

imshow(H,[]);

title('������ͼ��');

subplot(223);

hist(double(I),m);

title('ֱ��ͼ');

subplot(224);

hist(double(H),m)

title('������ֱ��ͼ');

 

%% �������˲�

figure(2)

subplot(3,2,1);

imshow(I);

title('ԭͼ��');

% ���뽷����������ʾ

II = imnoise(I,'salt & pepper');

subplot(3,2,2);

imshow(II);

title('���뽷���������ͼ��');

% ��ͨ�˲�ƽ��

[B,A] = butter(6,0.2,'low');

J = filter(B,A,double(II));

subplot(3,2,3);

imshow(J,[]);

title('��ͨ�˲�ƽ��');

% ��ֵ�˲�ƽ��

J = medfilt2(II);

subplot(3,2,4);

imshow(J,[]);

title('��ֵ�˲�ƽ��');

% ̬ͬ�˲�

[I0,M] = imread('test.bmp');
I0=rgb2gray(I0);

%I0 = II;M=[];

I1 = log(double(I0)+1);

I2 = fft2(I1);

N=2;D0=0.05*pi;rh=0.8;r=0.5;

[row,col]=size(I2);

for m=1:row

for n=1:col

D1(m,n)=sqrt(m^2+n^2);

H(m,n)=r+(rh/(1+(D0/D1(m,n))^(2*N)));

end

end

I3=I2.*single(H);

I4=ifft2(I3);

I5=exp(I4)-1;

 

subplot(3,2,5);

imshow(I0,M);

title('ԭͼ��');

subplot(3,2,6);

imshow(I5,M);

title('̬ͬ�˲����ͼ��');
