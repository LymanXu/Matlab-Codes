%% ��ȡ��������
clc,clear;

qianL=10;houL=12;
InFileName=['E:\data\titlesum.txt'];
fin=fopen(InFileName,'w+');
%for k=1:4
 %   disp(['�� ',num2str(k),' ��']);
    %InFileName=['E:\data\title',num2str(k),'.txt'];
    %fin=fopen(InFileName,'w+');
for i=1:49000
    disp(num2str(i));
    FileName=['E:\data\corpus\',num2str(i),'.txt'];
    fid=fopen(FileName,'r+','n','utf-8');
     tline=fgetl(fid);
     L=length(tline);
     title=tline(1,10:L-houL+1); %��β���˿ո�
     if ~isempty(title)
         fprintf(fin,'%s\r\n',title);
     end
     fclose(fid);
     
end

fclose(fin);


