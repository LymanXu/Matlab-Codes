%��������ͼ������ѡa b c

figure;
plot(disaster(:,1),disaster(:,2),'o');
hold on
service=[88,35;2,45;40,50];
%����Ȩ�� 0.3503 0.2825 0.3390
a= 0.3;b=0.3;c=0.4;
plot(service(:,1),service(:,2),'pr');
%% ����������� ȷ�� a b c 600 550 620
%DieN=100;
%for i=1:DieN
i=1;
[As,Bs,Cs]=selectAbc(disaster,service,a,b,c,demand);
 while   As>600||Bs>550||Cs>620
    disp(['�� ',num2str(i),' �ε���'])
    [As,Bs,Cs]=selectAbc(disaster,service,a,b,c,demand);
    %if  As>600||
        %break;
   % end
    %���� a
    i=i+1;
if i==20
break;
end

    %if As<600  %���Խ�����Խ��
        da=600-As;
    if abs(da)>5
    if  As<600 
        a=a-0.01;
    else 
        a=a+0.01;
    end
    end
    %����b
    %if Bs<550
   db=550-Bs;
   if abs(db)>5
     if Bs<550
        b=b-0.01;
    else 
        b=b+0.01;
    end
  end
    %���� c
dc=620-Cs;
if abs(dc)>5
    if Cs<620
        c=c-0.01;
    else 
        c=c+0.01;
    end
end
abcsum=a+b+c;
a=a/abcsum;
b=b/abcsum;
c=c/abcsum;
end
    
    
    
    
    %����
d1=a*sqrt((disaster(:,1)-service(1,1)).^2+(disaster(:,2)-service(1,2)).^2);
d2=b*sqrt((disaster(:,1)-service(2,1)).^2+(disaster(:,2)-service(2,2)).^2);
d3=c*sqrt((disaster(:,1)-service(3,1)).^2+(disaster(:,2)-service(3,2)).^2);

ad=[];bd=[];cd=[];
n=length(d1);
for i=1:n
    if d1(i)==min([d1(i),d2(i),d3(i)])
        la=length(ad);
        ad=[ad(1:la),i];
    elseif  d2(i)==min([d1(i),d2(i),d3(i)])
        lb=length(bd);
        bd=[bd(1:lb),i];
    else    %d3(i)==min([d1(i),d2(i),d3(i)])
            lc=length(cd);
          cd=[cd(1:lc),i];
     end
end

%����Ż����
disp('���յ������');
disp(['a=',num2str(a),'b=',num2str(b),'c=',num2str(c)]);
xuA=ad;
la=length(ad);
sumdemand=0;
for i=1:la
    indexa=xuA(i);
    sumdemand=sumdemand+demand(indexa);
end
disp(['A�� ����Ҫ��',num2str(sumdemand)]);

xuB=bd;
la=length(bd);
sumdemand=0;
for i=1:la
    indexa=xuB(i);
    sumdemand=sumdemand+demand(indexa);
end
disp(['B�� ����Ҫ��',num2str(sumdemand)]);

xuC=cd;
la=length(cd);
sumdemand=0;
for i=1:la
    indexa=xuC(i);
    sumdemand=sumdemand+demand(indexa);
end
disp(['C�� ����Ҫ��',num2str(sumdemand)]);
    