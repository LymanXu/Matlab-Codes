function [ place ] = find_MinHorizon( height_array )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[~,y_place]=find(height_array==min(height_array));
 place=y_place(1);
end

