function f= fitness(position )
%��������Ⱥ��ÿ���������Ӧ�ȣ�ƥ���Խ����Ӧ��Խ��
[m,n]=size(position);
f=zeros(m,1);
%��ʵӰ������
ylN=21;
TrueYL=[[0.596304178533930;0.613199680749257;0.630367408481833;0.647875460424187;0.665585902488486;
    0.683635322043225;0.701982000906913;0.720666941763752;0.739737128587382;0.759056927444726;
    0.778809717593994;0.798909216833717;0.819460656164860;0.840359465052014;0.861691331039699;
    0.883486869022059;0.905746771747443;0.928488919149548;0.951811148887353;0.975598840114507;1]];
%YingL=zeros(m,ylN);
for i=1:m
%��������Ӷ�Ӧ��Ӱ������
w=position(i,1);j=position(i,2);
YingLI=CalculateYingL(w,j);
%���Ӱ�����к���ʵ���е�ƥ���
%��¼Ӱ�ӳ�������
%YingL(i,:)=YingLT';
%�� 1 �ֱȽ����ƺ���
%ylMax=max(YingLI);
%newYL=YingLI/ylMax;
%distance=(newYL-TrueYL).^2;
%f(i,1)=1/sum(distance);

%����ͷ�����
valueCheng=chengFa2(w,j);
xx=sum(YingLI.*TrueYL);
x1L=(sum(YingLI.^2))^0.5;
x2L=(sum(TrueYL.^2))^0.5;
f(i,1)=10^6*xx/(x1L*x2L)-10^12*valueCheng;
%����غ���
%FI=corrcoef(YingLI,TrueYL);
%f(i,1)=FI(1,2);
end

end

