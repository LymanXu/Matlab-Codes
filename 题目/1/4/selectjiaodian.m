function [px,py] = selectjiaodian( cg,c2,a,b)
%�����������ߵĽ���
syms x;
yx=solve(cg*(x^a)-c2/(x^b));
y1=yx(1);
y=double(y1);
y=real(y);
yy=cg*(y^a);
px=y;
py=yy;

end

