function y = check_CR( CR,CI )
%��CR���м���
if CR<0.10
    disp('�˾����һ���Կ��Խ���!');
    disp('CI=');disp(CI);
    disp('CR=');disp(CR);
else disp('�˾����һ������֤ʧ�ܣ������½�������!');
    disp('����CI=');disp(CI);
    disp('����CR=');disp(CR);
end


end

