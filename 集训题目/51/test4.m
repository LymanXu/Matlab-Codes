%��֮ǰ�������Ļ���֮��
%���Ϊ��x =    1.0002    0.0000    1.0000    1.0018      resnorm =  1.1474e+04

xdata=x;
ydata=y;
X0=[1;1;1;1];
[x,resnorm]=lsqcurvefit(@lsfun,X0,xdata,ydata)