function [px,py]= solvechange(cg,c2,a,b)
%�����������ߵĽ��㣬cg ,c2 ,a, b Ϊ�������Ĳ���
syms x;
yx=solve(cg*(x^a)-c2/(x^b));
y1=yx(1);
y=double(y1);
y=real(y);
yy=cg*(y^a);
disp('���x,y');
px=y;
py=yy;
end

