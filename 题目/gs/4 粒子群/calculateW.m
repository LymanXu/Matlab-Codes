function w = calculateW( i,N )
%���ݵ�����������w
wStart=0.9;wEnd=0.4;
wD=wStart-wEnd;
w=wStart-(wD)*(i/N)^2;

end

