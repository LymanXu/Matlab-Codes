function [ flag ] = judege_feasibility( machine,X,Y,minHorizon )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
Y_max=2350;
if ( machine(1)<=X(minHorizon) && ( machine(2)<=Y_max-Y(minHorizon)) )
    flag=1;
else
    flag=0;
end

