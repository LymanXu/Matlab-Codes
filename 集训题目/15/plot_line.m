function y= plot_line(xdata)
%���������
plot(xdata(:,1),xdata(:,2),'ro-')
%�����������
hold on
ezplot('0.0576*x^2-0.0668*x*y+ 0.0506*y^2-3')
end

