%% ����Ƶ������ m*5536
teZhen=firstTe;
teL=length(firstTe);

newsIndex=NewIndex; %Ҫ��ȡ�����ŵ����,5536ƪ
newsL=length(newsIndex);
P=zeros(teL,newsL);  %���ƾ���

for k=1:newsL   %ÿ�μ���һƪ����
    disp(['�� ',num2str(k),' ������']);
    newsXuhao=newsIndex(k);  %�� i ƪ���µ�ʵ�����
    FileName=['E:\data\corpus\',num2str(newsXuhao),'.txt'];
    fid=fopen(FileName,'r+','n','utf-8');
    str=textscan(fid,'%s');
    a=str{1};
    x=tabulate(a);  %��һƪ���ŵ�������ȡ��x(;,1)
    [commentFlag,commentIndex]=ismember('comment',x(:,1));
    %��ȡcomment ֮ǰ�Ĺؼ���
    
    for i=1:teL  %�������������ʵ����ƾ���
          [oneCiFlag,oneCiIndex]=ismember(teZhen(i),x(:,1));
          if oneCiFlag==1 && oneCiIndex<commentIndex  %ͳ������֮ǰ��
              P(i,k)=x{oneCiIndex,2};  %��¼����Ƶ��
          end
    end
    fclose(fid);
end
    
    %% ��Ƶ�����������
    %һ�� �ؼ����ڼ����ĵ���
    CiAppearInFileN=zeros(teL,1);
    for i=1:teL
        [ff,index]=find(P(i,:)>0);
        CiAppearInFileN(i,1)=length(index);
    end
    SumPinInFile=zeros(1,newsL);
    for j=1:newsL  %ÿ���ĵ��дʵ���Ƶ��
        SumPinInFile(1,j)=sum(P(:,j));
    end
        
    