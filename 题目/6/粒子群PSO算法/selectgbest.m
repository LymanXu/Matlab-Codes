function y= selectgbest( fvalue,pbest )
%�ҳ�����Ⱥ�е���ʷ����λ��
id=find(fvalue==max(fvalue));

%������ڶ��λ�� fvalue ֵ��ͬ��ȡ��һ��
index=id(1);
y=pbest(:,index);


end

