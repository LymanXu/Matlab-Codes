% ���� ��ʱ�� �۸���½�����

figure;
[m,n]=size(pplot);
%�۸�仯����
%subplot(2,2,1);
plot([1:n-1],yandbu(1,:),'-p');
xlabel('ʱ��');ylabel('�߲˼۸�(��λ��Ԫ)');title('�߲˼۸�仯ͼ');
axis([1 60 2 3.6]);

%����֧��
figure;
zhichu=zeros(1,n);
zhichu=pplot(1,:).*pplot(2,:);
%subplot(2,2,2);
plot([1:n],zhichu,'-p');
xlabel('ʱ��');ylabel('����֧������λ����Ԫ��');title('����֧���仯ͼ');
axis([1 60 80 100]);
figure;
%��������
%subplot(2,2,3);
plot([1:n-1],yandbu(2,:),'-p');
xlabel('ʱ��');ylabel('������������λ����Ԫ��');title('���������仯ͼ');
axis([1 60 0 1]);

%�߲�������ʱ��仯
figure;
plot([1:n],pplot(1,:),'-p');
xlabel('ʱ��');ylabel('�߲˲�������λ���֣�');title('�߲˲����仯ͼ');




