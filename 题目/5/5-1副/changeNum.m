function lineNum= changeNum(tline)
%��ÿ���ַ��� 1 ���棬������ 0 ����

%������ż�
teFu=[' ' '��' '��' '(' ')' '��' '��' '.' '��' '��' '��' '��' '��' '��' '&' '��' '��' '��' '/' '��' '%' '��' '��' '+' '#'];
LteFu=25;

tL=length(tline);
lineN=zeros(1,tL);
for i=1:tL  %��tline��ÿ���ַ������⼯�Ƚ�
    index=find(tline(i)==teFu);
    if ~isempty(index)  %Ϊ���⼯��Ԫ��
        lineN(i)=0;
    else  %�����⼯
        lineN(i)=1;
    end
end
lineNum=lineN;

end

