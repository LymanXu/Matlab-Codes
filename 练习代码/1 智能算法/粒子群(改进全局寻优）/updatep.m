function [position, V] = updatep(position,Vf,pbest,gbest,Vscope,Pscope)
%����ÿ�����ӵ�λ��

%�Ȼ����ϴ�λ�ã�ͼ��
%hold on
%plot3(position(1,:),position(2,:),pfvalue)

%�����ٶ�  w �������� c1������ʶ����ʾ�����Լ���ʷ����ֵ��Ȩ�� c2�����֪������Ⱥ�����ŵ�Ȩ��
%x����
w=0.729;c1=2;c2=2;
[n,Psize]=size(pbest);
for i=1:Psize
    V(:,i)=w*Vf(:,i)+c1*rand*(pbest(:,i)-position(:,i))+c2*rand*(gbest(1,i)-position(:,i));
end
% ��֤�ٶ��ڷ�Χ֮��
V=vInScope(V,Vscope);
%����ÿ�����ӵ�λ��  rԼ������
r=1;
position=position+r.*V;
position=pInScope(position,Pscope);


end

