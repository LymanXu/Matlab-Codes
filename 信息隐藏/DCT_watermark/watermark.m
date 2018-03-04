%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ����ˮӡǶ�롢���������             %%%

clear all;
clc;
start_time=cputime;
%% ��ȡˮӡͼ�� %%%%%%%%
I=imread('mark.bmp');
%I=rgb2gray(I);
I=double(I)/255;
I=ceil(I);
%%%%%%%%%%��ʾˮӡͼ��%%%%%%%%%%%%%
figure(1);
subplot(2,3,1);
imshow(I),title('ˮӡͼ��')
dimI=size(I);
%ˮӡͼ��Ĵ�С
rm=dimI(1);cm=dimI(2);
%%  ��������ˮӡ��Ϣ %%
mark=I;
alpha=50,
k1=randn(1,8);
k2=randn(1,8);
a0=imread('lena.bmp');
psnr_cover=double(a0);
subplot(2,3,2),imshow(a0,[]),title('����ͼ��');
[r,c]=size(a0);

%�ֿ�,��ÿһ����� dct��ά�任
cda0=blkproc(a0,[8,8],'dct2');

%% Ƕ�� %%%%%%%%%%
cda1=cda0;   % cda1 = 256_256
for i=1:rm  % i=1:���п���
    for j=1:cm  % j=1:���п���
        x=(i-1)*8;y=(j-1)*8;   % �任������Ƶ�����Ӧ�Ŀ�Ŀ�ʼλ������
        if mark(i,j)==1
            k=k1;
        else
            k=k2;
        end
        
        %������Ƶ�����Ƶ�Ͻ���ˮӡע��
        cda1(x+1,y+8)=cda0(x+1,y+8)+alpha*k(1);
        cda1(x+2,y+7)=cda0(x+2,y+7)+alpha*k(2);
        cda1(x+3,y+6)=cda0(x+3,y+6)+alpha*k(3);
        cda1(x+4,y+5)=cda0(x+4,y+5)+alpha*k(4);
        cda1(x+5,y+4)=cda0(x+5,y+4)+alpha*k(5);
        cda1(x+6,y+3)=cda0(x+6,y+3)+alpha*k(6);
        cda1(x+7,y+2)=cda0(x+7,y+2)+alpha*k(7);
        cda1(x+8,y+1)=cda0(x+8,y+1)+alpha*k(8);
        
    end
end

%% Ƕ��ˮӡ��ͼ�� %%%%%%%%%%%%%%

%% ���Թ���ƽ̨��ͼƬ�Ĺ���
% ��Ƕ��ˮӡ��ͼ����� dct ��ά��任
a1=blkproc(cda1,[8,8],'idct2');
subplot(2,3,3),imshow(a1,[]),title('Ƕ��ˮӡ���ͼ��');

a_1=uint8(a1);

%����ˮӡ��ͼ�񱣴�
imwrite(a_1,'withmark.bmp','bmp');
disp('Ƕ��ˮӡ����ʱ��');
embed_time=cputime-start_time,
%% ����ʵ�� ����³���� %%%%%%%%%%%
disp('��Ƕ��ˮӡ��ͼ��Ĺ���ʵ�飬������ѡ���');
disp('1--��Ӱ�����');
disp('2--��˹��ͨ�˲�');
disp('3--JPEG ѹ��');
disp('4--ͼ�����');
disp('5--��ת10��');
disp('6--Stirƽ̨�ϵ� TEST_JPEG����');
disp('����--������');
d=input('������ѡ��1-6��:');
start_time=cputime;

figure(1);
switch d
    case 6
        subplot(2,3,4);
        %Stirƽ̨�ϵ� TEST_JPEG����
        a1 = imread('with_attack_byother.bmp');
        imshow(a1,[]);
        title('Stir������ĺ�ˮӡͼ��');
       
        %a_1 = uint8(a1);
        M1=a1;
    case 1
        WImage2=a1;
        noise0=20*randn(size(WImage2));
        WImage2=WImage2+noise0;
        subplot(2,3,4);
        imshow(WImage2,[]);
        title('�����������ͼ��');
        M1=WImage2;
        M_1=uint8(M1);
        imwrite(M_1,'whitenoise.bmp','bmp');
        
    case 2
        WImage3=a1;
        H=fspecial('gaussian',[4,4],0.2);
        WImage3=imfilter(WImage3,H);
        subplot(2,3,4);
        imshow(WImage3,[]);
        title('��˹��ͨ�˲���ͼ��');
        M1=WImage3;
        M_1=uint8(M1);
        imwrite(M_1,'gaussian.bmp','bmp');
        
    case 4
        WImage4=a1;
        WImage4(1:64,1:512)=512;
        %WImage4(224:256,1:256)=256;
        %WImage4(1:256,224:256)=256;
        %WImage4(1:256,1:32)=256;
        WImage4cl=mat2gray(WImage4);
        figure(2);
        subplot(1,1,1);
        %subplot(2,3,4);
        imshow(WImage4cl);
        title('���ּ��к�ͼ��');
        figure(1);
        M1=WImage4cl;
        %M_1=uint8(M1);
        %imwrite(M_1,'cutpart.bmp','bmp');
        
    case 3
        WImage5=a1;
        WImage5=im2double(WImage5);
        cnum=10;
        dctm=dctmtx(8);
        P1=dctm;
        P2=dctm.';
        imageDCT=blkproc(WImage5,[8,8],'P1*x*P2',dctm,dctm.');
        DCTvar=im2col(imageDCT,[8,8],'distinct').';
        n=size(DCTvar,1);
        DCTvar=(sum(DCTvar.*DCTvar)-(sum(DCTvar)/n).^2)/n;
        [dum,order]=sort(DCTvar);
        cnum=64-cnum;
        mask=ones(8,8);
        mask(order(1:cnum))=zeros(1,cnum);
        im88=zeros(9,9);
        im88(1:8,1:8)=mask;
        im128128=kron(im88(1:8,1:8),ones(16));
        dctm=dctmtx(8);
        P1=dctm.';
        P2=mask(1:8,1:8);
        P3=dctm;
        WImage5=blkproc(imageDCT,[8,8],'P1*(x.*P2)*P3',dctm.',mask(1:8,1:8),dctm);
        WImage5cl=mat2gray(WImage5);
        %figure(2);
        subplot(2,3,4);
        imshow(WImage5cl);
        title('��JPEGѹ����ͼ��');
        %figure(1);
        M1=WImage5cl;
    case 5
        WImage6=a1;
        WImage6=imrotate(WImage6,10,'bilinear','crop');
        WImage6cl=mat2gray(WImage6);
        figure(2);
        subplot(1,1,1);
        imshow(WImage6cl);
        title('��ת10�Ⱥ�ͼ��');
        figure(1);
        M1=WImage6cl;
    otherwise
        disp('�����������Ч���֣�ͼ��δ�ܹ�������ֱ�Ӽ��ˮӡ');
        subplot(2,3,4);
        imshow(a1,[]);
        title('δ�ܹ����ĺ�ˮӡͼ��');
        M1=a1;
end

%%    ��Ƶ������ȡˮӡ  %%%%%
psnr_watermarked=M1;
dca1=blkproc(M1,[8,8],'dct2');
p=zeros(1,8);
for i=1:dimI(1)
    for j=1:dimI(2)  % j=1:32
        x=(i-1)*8;y=(j-1)*8;
        p(1)=dca1(x+1,y+8);
        p(2)=dca1(x+2,y+7);
        p(3)=dca1(x+3,y+6);
        p(4)=dca1(x+4,y+5);
        p(5)=dca1(x+5,y+4);
        p(6)=dca1(x+6,y+3);
        p(7)=dca1(x+7,y+2);
        p(8)=dca1(x+8,y+1);
        %sd1=sum(sum(p.*k1))/sqrt(sum(sum(p.^2)));
        %sd2=sum(sum(p.*k2))/sqrt(sum(sum(p.^2)));
        %if sd1>sd2
        if corr2(p,k1)>corr2(p,k2),warning off MATLAB:divideByZero;
            mark1(i,j)=1;
        else
            mark1(i,j)=0;
        end
    end
end

subplot(2,3,5);
imshow(mark1,[]),title('��ȡ��ˮӡͼ��');
subplot(2,3,6);
imwrite(mark1,'getmark.bmp','bmp');
imshow(mark),title('ԭǶ��ˮӡ�Ƚ�');
%%%% time %%%%%%%
disp('��������ȡ����ʱ��')
attack_recover_time=cputime-start_time,
%%%%% psnr %%%%%%%
disp('����ͼ���뺬ˮӡͼ���ֵ�����')
PSNR=psnr(psnr_cover,psnr_watermarked,c,r),
%%%%%%% Oringinal mark and mark test %%%%%%%%%%
disp('ԭˮӡͼ������ȡˮӡͼ�����ϵ��')
NC=nc(mark1,mark),
