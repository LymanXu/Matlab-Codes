function [position, V] = updatep(position,Vf,pbest,gbest,Vscope,Pscope,w)
%����ÿ�����ӵ�λ��

%�Ȼ����ϴ�λ�ã�ͼ��
%hold on
%plot3(position(1,:),position(2,:),pfvalue)

%�����ٶ�  w �������� c1������ʶ����ʾ�����Լ���ʷ����ֵ��Ȩ�� c2�����֪������Ⱥ�����ŵ�Ȩ��
%x����
%w=0.729;
c1=1.49445;c2=1.49445;
[n,Psize]=size(pbest);
for i=1:n
for j=1:Psize
    V(i,j)=w*Vf(i,j)+c1*rand*(pbest(i,j)-position(i,j))+c2*rand*(gbest(1,j)-position(i,j));
end
end
% ��֤�ٶ��ڷ�Χ֮��
V=vInScope(V,Vscope);
%����ÿ�����ӵ�λ��  rԼ������
r=1;
position=position+r.*V;
position=pInScope(position,Pscope);


end

