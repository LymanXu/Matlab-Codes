%x0 = -0.6512  d_x =0.0319  ��51�ε���  y= 0.0460

x0=2;
N=1;
d_x=100;
while N<100 && d_x>0.01
    x=x0;
    x0=5*exp(-0.5*x)*sin(x+pi/6)
    d_x=abs(x-x0)
    N=N+1;
    disp(N);
end
disp('�������Ϊ:');disp(x0);