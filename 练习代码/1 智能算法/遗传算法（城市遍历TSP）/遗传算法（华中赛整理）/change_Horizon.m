function [ new_X,new_Y,new_minHorizon ] = change_Horizon( X,Y,minHorizon )
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

%% ���minHorizon���߻��л���ˮƽ��
if minHorizon>1 && minHorizon<size(X,2)
    %�����ߵͣ�����ϲ�
    if Y(minHorizon-1)<=Y(minHorizon+1)
        %����X��Y��minHorizon
        if (minHorizon-1)>1
            xFirst=X(1:minHorizon-2);
            yFirst=Y(1:minHorizon-1);
        else
            xFirst=[];
            yFirst=Y(1:minHorizon-1);
        end
        xLast=X(minHorizon+1:size(X,2));
        yLast=Y(minHorizon+1:size(X,2));
        
        new_X=[xFirst,X(minHorizon-1)+X(minHorizon),xLast];
        new_Y=[yFirst,yLast];
        new_minHorizon=find_MinHorizon(new_Y);
        
        %����ұߵͣ����Һϲ�
    elseif Y(minHorizon+1)<Y(minHorizon-1)
        %����X��Y��minHorizon
        xFirst=X(1:minHorizon-1);
        yFirst=Y(1:minHorizon-1);
        if (minHorizon+1)<size(X,2)
            xLast=X(minHorizon+2:size(X,2));
            yLast=Y(minHorizon+1:size(X,2));
        else
            xLast=[];
            yLast=Y(minHorizon+1:size(X,2));
        end
        new_X=[xFirst,X(minHorizon)+X(minHorizon+1),xLast];
        new_Y=[yFirst,yLast];
        new_minHorizon=find_MinHorizon(new_Y);
    end
else
    %% ���minHorizon������
    %���minHorizon�������
    if minHorizon==1
        if (minHorizon+1)<size(X,2)
            xLast=X(minHorizon+2:size(X,2));
            yLast=Y(minHorizon+1:size(X,2));
        else
            xLast=[];
            yLast=Y(minHorizon+1:size(X,2));
        end
        new_X=[X(minHorizon)+X(minHorizon+1),xLast];
        new_Y=yLast;
        new_minHorizon=find_MinHorizon(new_Y);
        %  ���minHorizon�����ұ�
    elseif minHorizon==size(X,2)
        if (minHorizon-1)>1
            xFirst=X(1:minHorizon-2);
            yFirst=Y(1:minHorizon-1);
        else
            xFirst=[];
            yFirst=Y(1:minHorizon-1);
        end
        new_X=[xFirst,X(minHorizon-1)+X(minHorizon)];
        new_Y=yFirst;
        new_minHorizon=find_MinHorizon(new_Y);
    end
end
end

