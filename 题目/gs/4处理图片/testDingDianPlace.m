clc,clear;
%% ��ʼ������
ImagesN=14;
DingDian=zeros(ImagesN,2);
YingL=zeros(14,1);
rowStart=849;rowEnd=898;colStart=810;colEnd=1699;
YuanDianRow=890;YuanDianCol=867;
%��λ���ض�Ӧ����ʵ����
dL=2/672;
%% 1 ����ͼƬ����ȡӰ�Ӷ����λ��

for K=1:ImagesN   
%1-1 ÿ�δ���һ��ͼƬ
sFileFullName=['E:\data\1gs\',num2str(K),'.bmp'];
A=imread(sFileFullName);
%1-2 ת��Ϊ�Ҷ�ͼ��
Ai=rgb2gray(A); 
%1-3 ����ͼ��
%rowStart=760;rowEnd=959;colStart=810;colEnd=1699;
%rowStart=849;rowEnd=898;colStart=810;colEnd=1699;
CutA=Ai(rowStart:rowEnd,colStart:colEnd);
%1-4 ͼ���ֵ������
w1=0.3922;w2=0.7176;
Atwo=zeros(size(CutA));
for i=1:125
Atwo(:,i)=im2bw(CutA(:,i),w1);
end
for i=126:890
    Atwo(:,i)=im2bw(CutA(:,i),w2);
end
%1-5 ͼƬ���պϡ�����
AI4=bwmorph(Atwo,'open');
%AI5=bwmorph(AI4,'close');
%figure
%imshow(Atwo);
%figure(2)
%imshow(AI4);
AI4=double(AI4);
%1-6 ��1��0�����û����󶥵�λ��
AIHuan=~AI4;
colSumA=sum(AIHuan,1);
index=find(colSumA>0);
DingCol=max(index)  %Ӱ�Ӷ������ڵ�����
%��Ӱ�Ӷ����Ӧ������
index=find(AIHuan(:,DingCol)==1);
numofIn=length(index);
DingRow=sum(index)/numofIn
%DingDian(K,1)=DingRow;
%DingDian(K,2)=DingCol;
%��Ӱ�ӵĶ�����ݵ������ģ������������
DingDian(K,1)=YuanDianRow-DingRow-rowStart;
DingDian(K,1)=DingDian(K,1)*dL;
DingDian(K,2)=colStart+DingCol-YuanDianCol;
DingDian(K,2)=DingDian(K,2)*dL;
YingL(K,1)=(sum(DingDian(K,:).^2)).^0.5;
disp(['�� ',num2str(K),' ��ͼƬ']);
%disp(['�����������',num2str(DingRow)]);
%disp(['�����������',num2str(DingCol)])
end
plot([8.9:0.05:9.55],YingL);
xlabel('ʱ��/Сʱ');ylabel('Ӱ��/��');