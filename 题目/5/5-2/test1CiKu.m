%% 1 ��ȡ��������¼��Ƶ��������������
newsIndex=NewIndex; %Ҫ��ȡ�����ŵ����
newsL=length(newsIndex);
newsComentNum=NewComentNum;  %���ŵ�ͶƱ����

%��¼����
CiKu={};Cif=[];Cinum=1;CipepleN=[];  %CipepleN,��Ҫ���У��ڶ��м�¼״̬flag
for i=1:newsL    %�� i ƪ����
    disp(['�� ',num2str(i),' ������']);
    newsXuhao=newsIndex(i);  %�� i ƪ���µ�ʵ�����
    FileName=['E:\data\corpus\',num2str(newsXuhao),'.txt'];
    fid=fopen(FileName,'r+','n','utf-8');
    str=textscan(fid,'%s');
    a=str{1};
    x=tabulate(a);  %��һƪ���ŵ�������ȡ��x(;,1)
    [commentFlag,commentIndex]=ismember('comment',x(:,1));
    %��ȡcomment ֮ǰ�Ĺؼ���
    for j=1:commentIndex-1  %����ÿ��cell
        charL=length(char(x(j,1)));
        nomalCharFlag=panDuannomalChar(x(j,1));%�������ַ��򷵻� 1 �����򷵻� 0
        if charL>1 &&nomalCharFlag==1 %�ַ�����>1ʱ��¼
            [haveciFlag,ciIndex]=ismember(x(j,1),CiKu);
            if haveciFlag==1  %�ʿ��д���
                Cif(ciIndex,1)=Cif(ciIndex,1)+1;
                if CipepleN(ciIndex,2)==0  %���ڱ����������ŵ�Ʊ��û�м���
                CipepleN(ciIndex,1)=CipepleN(ciIndex,1)+newsComentNum(i);
                CipepleN(ciIndex,2)=1;  %��־��ӹ�
                end
            else %�ʿ��в�����
                CiKu(Cinum,1)=x(j,1);
                Cif(Cinum,1)=1;
                CipepleN(Cinum,1)=newsComentNum(i); %��¼�������ڵ����µ�Ʊ��
                CipepleN(Cinum,2)=1;  %1 ��ʾ���ô����Ѽ��뱾���ŵ�Ʊ��������������ʱ������Ըô�������Ʊ��
                Cinum=Cinum+1;
            end
        end
    end
    fclose(fid);
    %��ʼ������CipepleN��״̬����,ͳ����ƪ����
    CipepleN(:,2)=0;
    
end

%% 2 ������������
    