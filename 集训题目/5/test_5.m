C=[-4 -10 -3 2];
A=[2 3 0 0;
   3 4 0 0];
B=[16;24];
Aeq=[-2 2 0 1];
Beq=[0];
LB=[0 0 0 0];
UB=[Inf Inf 5 Inf];
disp('x���Ϊ��');
[x Q]=linprog(C,A,B,Aeq,Beq,LB,UB)
%disp(['x���Ϊ��',num2str(x)]);
disp(['���ֵΪ��',num2str(-Q)]);