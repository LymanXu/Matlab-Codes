function SelCh= Recombin(SelCh,Pc)
%�������
% SelCh ��ѡ��ĸ��� PC ������� SelCh �����ĸ���
NSel=size(SelCh,1);
%??? �� 1 or 0
for i=1:2:NSel-mod(NSel,2)
    if Pc>=rand
        [SelCh(i,:),SelCh(i+1,:)]=intercross(SelCh(i,:),SelCh(i+1,:));
    end
end

end

