function [ newpbest,newpf,newgbest,newgF] = updateBest(position,pbest,gbest,pfvalue,fvalue,gbestF,ParticleScope)
%������Ⱥ���ż�¼
%pbest ������ʷ����λ��  fvalue ������ʷ������Ӧ��
N=size(pbest,1);%N������

for i=1:N
    if pfvalue(i)>fvalue(i)  %�µ�λ�õ� ����Ӧ�� ������ʷ���ŵ�
        pbest(i,:)=position(i,:);
        fvalue(i)=pfvalue(i);
    end
end

%����������� ��һ�� ��������������ʷ����
%newpbest=zeros(size(pbest));
%newpf=zeros(N,1);
%������������������  1
%for i=1:N
 %   r=rand;
  %  while r==0
   %     r=rand;
    %end
    %c=floor(r*N)+1;
    %����λ��,��Ӧ��
    
    %newpbest(i,:)=r*pbest(i,:)+(1-r)*pbest(c,:);
    %newpbest(i,:)=pbest(i,:);
    %newpf(i,1)=r*fvalue(i)+(1-r)*fvalue(c);
    %newpf(i,1)= fitness(newpbest(i,:));
%end
newpbest=pbest;
newpf=fvalue;
[newgbest,newgF]=SelectGbest(newpbest,gbest,newpf,gbestF,ParticleScope);
end

