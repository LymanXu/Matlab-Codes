
%������������Ƿ�һ��
for i=1:58
    for j=1:58
        if Dis1(i,j)~=Dis2(i,j)
            if i>=1&&i<=8
                if j>=1&&j<=8
                    disp(['����',num2str(i),'������',num2str(j),'��������']);
                elseif  j>=9 && j<=43
                    disp(['����',num2str(i),'�����۵�',num2str(j-8),'��������']);
                else j>=44&&j<=58
                       disp(['����',num2str(i),'��·��',num2str(j-43),'��������']);
                end
            elseif   i>=9&&i<=43
              if j>=1&&j<=8
                    disp(['���۵�',num2str(i-8),'������',num2str(j),'��������']);
              elseif j>=9&&j<=43
                    disp(['���۵�',num2str(i-8),'�����۵�',num2str(j-8),'��������']);
                else j>=44&&j<=58
                       disp(['���۵�',num2str(i-8),'��·��',num2str(j-43),'��������']);
              end
            else  i>=44&&i<=58
                if j>=1&&j<=8
                    disp(['·��',num2str(i-43),'������',num2str(j),'��������']);
                elseif  j>=9&&j<=43
                   
                    disp(['·��',num2str(i-43),'�����۵�',num2str(j-8),'��������']);
                else j>=44&&j<=58
                       disp(['·��',num2str(i-43),'��·��',num2str(j-43),'��������']);
                end
            end
            
        end
    end
    end
    