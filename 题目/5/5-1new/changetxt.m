%% ֻ��ȡ��һ������
FileName=['E:\data\pinGE.txt']; 
fid=fopen(FileName,'r+','n','utf-8');
InFileName=['E:\data\titletxt.txt'];
InFileF=['E:\data\twof.txt'];
fin=fopen(InFileName,'w+');

    while ~feof(fid)  %�����ļ�
         tline=fgetl(fid);
        % L=length(tline);  %��ȡһ��
        index=find(' '==tline);
        index=index(1)-1;
        strtitle=tline(1,1:index);
        
        if ~isempty(strtitle)
         fprintf(fin,'%s\r\n',strtitle);
        end
    end
    fclose(fid);
    fclose(fin);
        