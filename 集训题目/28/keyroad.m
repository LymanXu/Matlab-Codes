function y = keyroad( snode,enode,time )
%snode ��¼ǰ���� enode ��¼�󶥵� time ��¼����֮��Ĺ���ʱ��
n=10; %��������
earlyst=zeros(1,n);
%earlyst(1,1)=0;
latelyst=inf*ones(1,n);   %��¼���� �� ���� ��ʼʱ��

in=length(snode);
for i=1:in   %ÿ��ѭ������ ��Ӧ�������ʱ��
    firstid=snode(i);
    nextid=enode(i);
    if earlyst(nextid)<(earlyst(firstid)+time(i))
        earlyst(nextid)=earlyst(firstid)+time(i);
    end
end
%y=earlyst;       

%latelystnode=find(earlyst==max(earlyst));
%late_f_node=latelystnode(1);
%��ʼ�� st(late_f_node)=earlyst(late_f_node);

%��ʼ��latelyst 
maxtime=max([earlyst(10),earlyst(8),earlyst(9)])
latelyst(10)=maxtime;
latelyst(9)=maxtime;
latelyst(8)=maxtime;
for i=in:-1:1 %���Ƴ�����ʼʱ��ĵ�һ����
 %ÿ��ѭ������ ��Ӧ�������ʱ��
    firstid=enode(i);
    nextid=snode(i);
    if latelyst(nextid)>(latelyst(firstid)-time(i))
        latelyst(nextid)=latelyst(firstid)-time(i);
    end
end
%������
result=[];
for i=1:n
    if earlyst(i)==latelyst(i)
        result=[result,i];
    end
end
disp('�ؼ�·���ϵĽڵ�����Ϊ��');disp(result);
        
 
 
 
 
 
 
 
 
    

    
    
end

