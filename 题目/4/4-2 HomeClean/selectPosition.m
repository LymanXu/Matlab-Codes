function position = selectPosition( JiQiZhen,oldPosition )
%Ѱ�ң�������������·���ߵĲ�������ĵ�,�浽positon
oldx=oldPosition(1);
oldy=oldPosition(2);
[row,col]=find(JiQiZhen==1);
L=length(row);
pJuLi=inf*ones(L,1);
for i=1:L    %���� ������0 �ĵ� �뵱ǰ����λ�õľ���
    x=row(i);y=col(i);
    pJuLi(i,1)=(x-oldx)^2+(y-oldy)^2;
end
[~,Srx]=min(pJuLi);
px=row(Srx);
py=col(Srx);
position=[px,py];

end

