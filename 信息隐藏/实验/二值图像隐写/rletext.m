clc; 
clear all; 
oi=imread('marked.bmp');%��Я��ͼ��
[row col ]=size(oi); 
oi=oi(:); 
len=size(oi);
i=1; j=1; 
while (i< len(1))  
    or=oi(i);  
    count=1; 
  while(i<len(1)&&oi(i+1)==or)    
      i=i+1; 
    count=count+1;  
  end 
 RLE(j)=count;
 j=j+1;
 i=i+1; 
end 
if i==len(1)   
    RLE(j)=1;
end 
RLE=RLE';
msgcount=96;   %����֪��ˮӡ�ĳ��� 
for i=1:msgcount   
    msg(i,1)=0;
end 
for l=1:msgcount 
if mod(RLE((2*l),1),2)==0 
  msg(l,1)=0       %����γ̵�ֵΪż������ʾ���ص���ϢΪ0 
else 
  msg(l,1)=1       %����γ̵�ֵΪ��������ʾ���ص���ϢΪ1 
end
end;
%ot=Vector2Matrix(msg,msgcount/8);
ot=reshape(msg,8,msgcount/8);
ot=ot';
ot=int2str(ot);
out=bin2dec(ot);

%out=bit2num(ot);
fid=fopen('message.txt','wt'); 
fwrite(fid,out);
fclose(fid); 