function  [haveFlag,index] = panDuanHave( twoLci,ds )
%�жϵ�ǰ�ʿ�����û�б�������������з��� 1���ʹ���λ�ã�û�оͷ��� 0
LCi=size(twoLci,1); %����
haveFlag=0;index=[];

if LCi==0
    haveFlag=0;
    index=[];
else %�ʿ��д���ֵ
    for i=1:LCi
        if twoLci(i,:)==ds
            index=i;
            haveFlag=1;
            break;
        end
    end
end

end

