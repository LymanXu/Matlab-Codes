function ZhongFlag = panDuanZhong( JiZhen )
  % ���jizhen ��û�п�ȥ�� 0 ������Ϊ�������
  %JiTi=JiZhen();
  index=find(JiZhen==1);
  L=length(index);
  if L==0
      ZhongFlag=0;
  else   %�п�ȥ֮��
      ZhongFlag=1;
  end

end

