function ZiPathI = addEndNode( PathEnd,PathTiaoEndNodeI )
 % ���� ǰ·������󶥵� ���� i ��
 indexI=find(PathTiaoEndNodeI==0);
 indexI=indexI(1);
 ZiPathI=PathTiaoEndNodeI;
 ZiPathI(indexI)=PathEnd;

end

