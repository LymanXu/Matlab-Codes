clc   %����
 clear  %��ձ���
 close all  %�ر��Ѵ�ͼ��

% ��������ͼ�� ����ʾ
 cover_object=imread('orign.jpg');
 if ndims(cover_object)==3  %�����rbgͼ����ת��Ϊ�Ҷ�ͼ��
     cover_object=rgb2gray(cover_object);
 end
 figure;
 imshow(cover_object); %��ʾ
 title('����ͼ��');

% ����ˮӡͼ��  ����ʾ
 message=imread('shuiyin.jpg');
 if ndims(message)==3  %�����rbgͼ����ת��Ϊ�Ҷ�ͼ��
     message=rgb2gray(message);
 end
 [Mm,Nm]=size(message);
 message=double(message);
 message=round(message./256); %ת��Ϊbit��Ϣ�����Ա���д
 message=uint8(message);
 figure;
 imshow(256*message); %��ʾ
 title('��������Ϣ');

%����yinxie����ʵ����Ϣ��д
 watermarked_image=yinxie(cover_object,message);
 figure;
 imshow(watermarked_image,[])
 title('��Ƕ����д��Ϣ��ͼ��') %��ʾ


%����tiqu����ʵ����Ϣ��ȡ
 watermark=tiqu(watermarked_image,Mm,Nm);
 figure;imshow(watermark,[])%��ʾ��ȡͼ��
 title('��ȡ����Ϣ')

 

