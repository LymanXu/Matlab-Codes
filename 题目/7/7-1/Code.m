function ret = Code( lenchrom)
%��Ⱦɫ����б��룬������4 �Ҵ���ʼ���ĸ��� 1 37 1333  1369
%��֤��ʼ��Ϊ����һ�����ĳ�ʼλ�ã����������е�Ⱦɫ������Ϊ 1
L=lenchrom;
oneChrom=randperm(L);

first=oneChrom(1,1);
index=find(oneChrom==1);
oneChrom(1,1)=1;
oneChrom(1,index)=first;
ret=oneChrom;

end

