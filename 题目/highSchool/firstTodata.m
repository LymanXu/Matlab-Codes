%%Ԥ��������

[m,n]=size(MyCityCrimeData);
%ͳ�Ʒ�������
type=unique(MyCityCrimeData(:,2));
%ͳ�Ʒ���ص�
location=unique(MyCityCrimeData(:,3));
%ͳ��Ƶ��
ptype=tabulate(MyCityCrimeData(:,2));
ploca=tabulate(MyCityCrimeData(:,3));
%ͳ�Ʒ���ص�
location=tabulate(newCrimeData(:,4));
[m,n]=size(location);
suml=1;
for i=1:m
    ploca=cell2mat(location(i,3));
    if ploca>2
        largeLoca2(suml,:)=location(i,:);
        suml=suml+1;
    end
end

%��ȡƵ��>5%�ķ��ﰸ��
sumtype=1;
for i=1:27
    if(a(i)>=3)
       index=i;
       typeEnd(sumtype,:)=ptype(index,:);
       sumtype=sumtype+1;
    end
end

%��ͼ
p=[28.2656 10.562 9.792 5.0707 27.2353 10.3207];
p=p/100;
x=[1:6];
bar(x,p);
xlabel('CASE TYPE');ylabel('Frequency');

%���ݵ���ȡ
sumNum=1;
[m,n]=size(MyCityCrimeData);
for i=1:m
    oldData=MyCityCrimeData{i,2};
    for j=1:10
        celltype=typeEnd{j,1};
      if(isequal(oldData,celltype))
        newCrimeData(sumNum,:)=MyCityCrimeData(i,:);
        sumNum=sumNum+1;
        break;
    end
    end
end


%%ͳ���µ����ݵ��������
newLocation=tabulate(newCrimeData(:,4));
