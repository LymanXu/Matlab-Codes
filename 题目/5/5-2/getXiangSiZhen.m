%% �õ����ƾ���
teZhen=teZhenCi;  %������
newsIndex=NewIndex; %Ҫ��ȡ�����ŵ����
newsL=length(newsIndex);

tL=length(teZhen);
T=zeros(tL,newsL);  %���ƾ���
for k=1:newsL   %ÿ�μ���һƪ����
    disp(['�� ',num2str(i),' ������']);
    newsXuhao=newsIndex(i);  %�� i ƪ���µ�ʵ�����
    FileName=['E:\data\corpus\',num2str(newsXuhao),'.txt'];
    fid=fopen(FileName,'r+','n','utf-8');
    str=textscan(fid,'%s');
    a=str{1};
    x=tabulate(a);  %��һƪ���ŵ�������ȡ��x(;,1)
    [commentFlag,commentIndex]=ismember('comment',x(:,1));
    %��ȡcomment ֮ǰ�Ĺؼ���
    
     for i=1:tL  %�������������ʵ����ƾ���
          [oneCiFlag,oneCiIndex]=ismember(teZhen(i),x(:,1));
          if oneCiFlag==1 && oneCiIndex>commentIndex  %ͳ������֮ǰ��
              T(i,k)=x(oneCiIndex,2);  %��¼����Ƶ��