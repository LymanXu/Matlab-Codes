function dayLSum= DayLength( tcity,tplay,chrom )
%���㵱ǰ·���µ�������������¼��ÿ��·�ߵ���������ÿ�����һ�����ξ���
[num,chromL]=size(chrom);

dayLSum=zeros(num,1); %��ռ����,��ʡ��ʱ�ȴ�һ�죬���Գ�ʼ��Ϊ 1
luxianIndex=zeros(num,chromL);%��¼ÿһ�� �������һ������


for i=1:num %ÿ�δ��� 1 ��·��
    timeNow=7;%��ǰʱ�䣬��Χ 7:00 -- 19:00
    dayLength=1; %��ռ����,��ʡ��ʱ�ȴ�һ�죬���Գ�ʼ��Ϊ 1
    timeDrive=0; %�г�ʱ��
    chromI=[chrom(i,:),chrom(i,1)];
    nextFlag=0;  % 0 ��ʾ��������ǰ·��
    numhavecity=1;
    flaggo=1;%ȥ��һ������
    luxianIndex(i,1)=1;
    %����·���еĳ���
   
    while nextFlag==0
        pstart=chromI(numhavecity);pend=chromI(numhavecity+1);
      %% Լ������ 
       % 1 �г�ʱ��Լ��
     
     newtimeDrive=timeDrive+tcity(pstart,pend);
     newtimeNow=timeNow+timeDrive+tplay(pend);
     newtimeNowDrive=timeNow+tcity(pstart,pend);  %�г�ʱ�䲻�ܡ�19:00
     if newtimeDrive>8 || newtimeNow>18 || newtimeNowDrive>19
         
         flaggo=0;
     end

     if flaggo==1 %�����µĳ���
         numhavecity=numhavecity+1;
         timeDrive=timeDrive+tcity(pstart,pend);
         timeNow=timeNow+timeDrive+tplay(pend);
         timeNowDrive=timeNow+tcity(pstart,pend);  %�г�ʱ�䲻�ܡ�19:00
         %numhavecity=numhavecity+1;
     else %��ʼ�µ�һ��
         %һ�쿪��ʱ�䡷8ʱ����������
         indexLX=find(luxianIndex(i,:)==0);
         if  ~isempty(indexLX)
         indexLX=indexLX(1);
         else
             break;
         end
         luxianIndex(i,indexLX)=pstart; %��¼�������һ�����ξ���

         dayLength=dayLength+1;
         timeDrive=0;  %������ 1 ���µ�һ��
         timeNow=7;
     end
     flaggo=1; %���Ҫ flaggo=1 �ԶԺ������з���
     if numhavecity==(chromL+1)   %�ص�ʡ��ԭ��
         nextFlag=1;
     end
    end
dayLSum(i,1)=dayLength;

end
end

