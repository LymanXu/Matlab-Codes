%�ֶκ��������    ���:  3.1485
clc,clear;
%syms x;
x=sym('x');
f=2+(cos(x))^2;
sum1=int(f,-1,0);
f=(exp(-(x)^2))*sin(x);
sum2=int(f,0,2);
sum=double(sum1)+double(sum2);
disp('���ֽ��Ϊ��');disp(sum);