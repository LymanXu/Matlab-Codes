function watermarked_image=yinxie(cover_object,message)
 % ��ȡ����ͼ��Ĵ�С
 [Mc,Nc]=size(cover_object);
 % ��ȡˮӡͼ��Ĵ�С
 [Mm,Nm]=size(message);
 length_message=Mm*Nm;%��Ϣ����
 message(Mc,Nc)=0;
 watermarked_image=cover_object;


 %ÿһ����������Ϣ��������ͼ���һ�����ظ��أ�������ܱ��������ػҶ�
 %ֵ�����λ��ͬ�������޸ģ�������ԭʼ�Ҷ�ֵΪ���������1����Ϊ
 %ż�������1

 

% mod(cover_object(ii,jj),2)   ��ȡͼ��cover_object������ֵ�����λ

for ii = 1:Mc
     for jj = 1:Nc
         if mod(cover_object(ii,jj),2)==message(ii,jj)%�ж��Ƿ����
             continue; %����ȣ������޸�
         else %����
             if mod(cover_object(ii,jj),2)==0 %��Ϊż�����1
                 watermarked_image(ii,jj)=cover_object(ii,jj)+1;
             else %��Ϊ�棬���1
                 watermarked_image(ii,jj)=cover_object(ii,jj)-1;
             end
         end
     end
 end

