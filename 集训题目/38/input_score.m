function [  ] = input_score()
% �������ѧԺ��û�ſ�Ŀ�ĳɼ��������Ȩ�ؾ���
%score=input('����ɼ���');
%[m,n]=size(score);
m=4;
n=7;
for i=1:m   %ÿ��ѭ������һ��7*7��Ȩ�ؾ���
    score=input('���뵥��ѧ�Ƴɼ���');
   for j=1:n
       for k=1:n
           score_pan(j,k)=score(1,j)/score(1,k);
       end
   end
disp(['��',num2str(i),' ��Ȩ�ؾ���Ϊ��']);disp(score_pan);
end

end

