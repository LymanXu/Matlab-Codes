%% ���� �����ֵ�Ƶ�ʣ������ļ�ÿ����β �пո�   !!!!!!!!!!!!!!!!!!!!!!

individuals=struct('twoLCi',[],'f',[]);  %��Ⱥ�ṹ��

i=1;
%FileName=['E:\data\title',num2str(i),'.txt'];  %��ȡһ��title�ļ�

FileName=['E:\data\titlesum.txt']; 
    fid=fopen(FileName,'r+','n','utf-8');
    CiNum=1;
     while ~feof(fid)  %�����ļ�
         tline=fgetl(fid);
         L=length(tline);  %��ȡһ��
         
         lineNum=changeNum(tline);  %���ַ���1 ���棬������ 0
         for j=2:L-9 %����һ�У�ͳ�Ƽ�¼ �����ֵĴ�
             if lineNum(j-1)==0 && lineNum(j)==1 &&lineNum(j+1)==1 && lineNum(j+2)==1 &&lineNum(j+3)==1 &&lineNum(j+4)==1 && lineNum(j+5)==1 && lineNum(j+6)==1 && lineNum(j+7)==1 &&lineNum(j+8)==1 &&lineNum(j+9)==0
                 ds=[tline(j),tline(j+1),tline(j+2),tline(j+3),tline(j+4),tline(j+5),tline(j+6),tline(j+7),tline(j+8)];
                 disp(ds);
                 %�жϵ�ǰ�ʿ�����û�б�������������з��� 1���ʹ���λ�ã�û�оͷ��� 0
                 [haveFlag,index]=panDuanHave(individuals.twoLCi,ds);
                 if haveFlag==0  %��һ�μ�¼�ô���
                     individuals.twoLCi(CiNum,:)=char(ds);   %��¼����
                    % CiTiao(CiNum,:)=char(ds);
                     %��ʱ f(CiNum)Ϊ�գ���һ��ʹ��
                     individuals.f(CiNum)=1;
                     CiNum=CiNum+1;
                 else   %���ڸô���
                     individuals.f(index)=individuals.f(index)+1;
                 end
             end
         end
     end
       CiTiao=char(individuals.twoLCi);              
       pinLv=individuals.f;  
%%   �����д���ļ�CiTao pinLv
P=pinLv;
InFileName=['E:\data\nine.txt'];
InFileF=['E:\data\ninef.txt'];
fin=fopen(InFileName,'w+');
finf=fopen(InFileF,'w+');

cinum=size(CiTiao,1);
disp('�����д��four�ļ�');
for  i=1:cinum
      maxf=max(P);
      %if maxf>1
      index=find(P==maxf);index=index(1);
      tline=[CiTiao(index,:),' ',num2str(pinLv(index))];
      if ~isempty(tline)
         fprintf(fin,'%s\r\n',tline);
      end
      fprintf(finf,'%s\r\n',num2str(pinLv(index)));
      %ͳ�ƹ���Ĵ�������ͳ��
      P(index)=-1;
      %end
end
fclose(fin); 
fclose(finf);
             
         