function R= makeR(X,Low)
%���� ,Low Ϊ���е��Ż���������
[m,n]=size(X);

RI=zeros(m,1);
R=zeros(m,n);


  %%ע�Ȿ�α��ȵ�ʱ�������ֵ��ͬ�����
  
for i=1:n  %ÿ��ѭ������һ������
     XI=X(:,i);
     
    if find(i==Low)  %���е��ű���
        for j=1:m 
            index=find(XI==max(XI));
            index=index(1);
            RI(index)=j;
            XI(index)=-inf;
          
        end
        R(:,i)=RI;
    else
        for j=1:m  %���и�������
            index=find(XI==min(XI));
            index=index(1);
            RI(index)=j;
            XI(index)=inf;
            
        end
        R(:,i)=RI;
    end
        
end


end

