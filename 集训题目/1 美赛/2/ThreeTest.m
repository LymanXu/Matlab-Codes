%������׷���
clc,clear;
[t,yy]=ode45('lorenzfun',[0:0.01:100],[5;13;17]); %ģ��t=0~100����0.01��10001���㣬��ֵ[-1;0; 1]
x=yy(:,1);
y=yy(:,2);
z=yy(:,3);

figure(1);
plot3(x,y,z);
xlabel('x(t)'),ylabel('y(t)'),zlabel('z(t)');
