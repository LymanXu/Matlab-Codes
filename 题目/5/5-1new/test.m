%%  ����ÿ�����ŵĹؼ���ָ�����
Citiao=titletxt;
m=length(Citiao);
n=10000;
newF=zeros(m,n);

for i=10001:20000
    disp(['�� ',num2str(i),' ������']);
    FileName=['E:\data\corpus\',num2str(i),'.txt'];
   
    fid=fopen(FileName,'r+','n','utf-8');
    str=textscan(fid,'%s');
    a=str{1};
    x=tabulate(a);
    [tFlag,index]=ismember(Citiao,x(:,1));
    for j=1:m
        if tFlag(j)==1 %����
            xm=index(j);
            onef(j,1)=cell2mat(x(xm,2));
        else
            onef(j,1)=0;
        end
    end
    %���µ�һƪ���Ŷ�Ӧ����
    newF2(:,i)=onef;
    fclose(fid);
end
    
    
    
