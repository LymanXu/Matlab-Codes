%����lastDAta �����ݽ��й�һ��
numMin=min(lastData(:,1));
numMax=max(lastData(:,1));
numLeng=numMax-numMin;
beatMin=min(lastData(:,5));
beatMax=max(lastData(:,5));
beatLeng=beatMax-beatMin;
for i=1:5
    Min(i)=min(lastData(:,i));
    Leng(i)=max(lastData(:,i))-Min(i);
end

row=84;
GuiyiLastData=lastData;
for i=1:row
    for j=1:5 %��һ������
    GuiyiLastData(i,j)=(GuiyiLastData(i,j)-Min(j))/Leng(j);
    end
end

%�õ���һ��������ݣ�����ÿ�స����Σ����
lk=[0.2,0.15,0.35,0.1,0.2];
W=zeros(row,1);
for i=1:row
    for k=1:5
    W(i,1)=W(i,1)+lk(k)*GuiyiLastData(i,k);
    end
end

%�ۺ�6����ÿ��İ�ȫϵ��
Z=zeros(14,1);
wk=[0.15,0.25,0.3,0.15,0.1,0.05];
for i=1:14
    dayfirstindex=(i-1)*6;
    for index=1:6
        leiindex=dayfirstindex+index;
        Z(i)=Z(i)+wk(index)*W(leiindex,1);
    end
end
  

Day=[1:14];Degree=Z;
%xlabel('Date');ylabel('Crime Harm Degree');


%��ͼ��6�෸����ʱ��仯ͼ
crimeNum=zeros(6,14);
for i=1:14 %ʮ����
    findex=(i-1)*6;
    for crimei=1:6 %���స��
        crimeNum(crimei,i)=lastData(findex+crimei,1);
    end
end

figure;
hold on
for i=1:6
    plot(Day,crimeNum(i,:),'.-','Color',[0.1*6 0.4+0.1*i 1/i]);
end
legend('A','B','C','D','E','F');
xlabel('Day');ylabel('Number');
hold off

%����ʱ�����ص�Ӱ�죬����˥������
deli=0.78;
%�������
TimeDegree=zeros(14,1);
TimeDegree(1)=Degree(1);
for i=2:14
    TimeDegree(i)=deli*Degree(i)+(1-deli)*Degree(i-1);
end
TimeDegree=1-TimeDegree;

   
    


