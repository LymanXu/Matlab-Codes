A=imread('E:\MATLAB����\��ϰ����\ͼ����\images\1.bmp');
subplot(2,2,1);
imshow(A);
title('ԭͼ��');

Ai=rgb2gray(A);
subplot(2,2,2);
imshow(Ai);
title('�Ҷ�ͼ��');

An=im2bw(Ai,0.555);
subplot(2,2,3);
imshow(An);
title('��ֵͼ��');


