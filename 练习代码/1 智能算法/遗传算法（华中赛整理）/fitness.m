function [ fitness ] = fitness( chrom )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
X_max=900;    %ľ����
% Y_max=2350;   %ľ��߶�
Y_max=3000;
R=[350,300
    350,200
    500,240
    500,210
    500,350
    250,300
    250,200
    500,400
    500,200];
initial_R=[R;R];
%����������
n=size(initial_R,1);
Areas=0;
for numbers=1:n
    Areas=Areas+initial_R(numbers,1)*initial_R(numbers,2);
end

[num,length]=size(chrom);
fitness=zeros(num,1);

for number=1:num
    R=zeros(n,2);
    for l=1:length
        R(l,:)=initial_R(chrom(number,l),:);
    end
%     disp(num2str(R));
    
    N=size(R,1);  %�������
    X=X_max;      %��ʼ���ˮƽ�ߵĿ��
    Y=0;          %��ʼ���ˮƽ�ߵĸ߶�
    i=1;          %��ǰ��������
    count=0;     %�����ɹ��ĸ���
    minHorizon=find_MinHorizon(Y);  %���ˮƽ��λ��
    %% ����ѭ������
    while(1)
        if( X(minHorizon)-R(i,2) < X(minHorizon)-R(i,1) )...
                ||(X(minHorizon)-R(i,2)>0&&X(minHorizon)-R(i,1)<0)
            t=R(i,1);R(i,1)=R(i,2);R(i,2)=t;
        end

% disp(['minHorizon=',num2str(minHorizon)]);
% disp(['i=',num2str(i),' count=',num2str(count)]);
% % y_l=Y_max-Y(minHorizon);
% disp(['X=',num2str(X),' Y=',num2str(Y)]);
% disp(['R(i,1)=',num2str(R(i,1)),' R(i,2)=',num2str(R(i,2))]);
% disp('------------------------------------');
        if((Y_max-Y(minHorizon))<R(i,2))
            fitness(number,1)=0;
%             disp('���Ȳ���');
            break;
        end
        %% �����ˮƽ�������ǰ���ʱ
        if (R(i,1)<X(minHorizon)) && (R(i,2)<=Y_max-Y(minHorizon))
            if minHorizon>1
                xFirst=X(1:minHorizon-1);
                yFirst=Y(1:minHorizon-1);
            else
                xFirst=[];
                yFirst=[];
            end
            if minHorizon<numel(X)
                xLast=X(minHorizon+1:numel(X));
                yLast=Y(minHorizon+1:numel(Y));
            else
                xLast=[];
                yLast=[];
            end
            X=[xFirst,R(i,1),X(minHorizon)-R(i,1),xLast];
            Y=[yFirst,Y(minHorizon)+R(i,2),Y(minHorizon),yLast];
            
            minHorizon=find_MinHorizon(Y);
            count=count+1;
            i=i+1;
            
            %% �����ˮƽ�߿�ȸպ��ʺ����ǰ���ʱ
        elseif (X(minHorizon)==R(i,1)&& (Y_max-Y(minHorizon))>=R(i,2))
            if minHorizon>1
                yFirst=Y(1:minHorizon-1);
            else
                yFirst=[];
            end
            if minHorizon<numel(X)
                yLast=Y(minHorizon+1:numel(Y));
            else
                yLast=[];
            end
            Y=[yFirst,Y(minHorizon)+R(i,2),yLast];
            
            minHorizon=find_MinHorizon(Y);
            count=count+1;
            i=i+1;
            
            %% ����ǰ����Ų���ȥ���ˮƽ��ʱ��������ˮƽ��
        else
            if i<N
                %�Ժ��������ܷ��ڵ�ǰˮƽ���Ϸ���
                for j=(i+1):N
                    flag=judege_feasibility( R(j,:),X,Y,minHorizon );
                    if(flag==1)
                        r=R(i,:);
                        R(i,:)=R(j,:);
                        R(j,:)=r;
                        break;
                    end
                end
            end
            if i==N
                flag=0;
            end
            %% ������Ҳû�к��ʵģ���ʼ����ˮƽ��
            if flag==0
                [X,Y,minHorizon]=change_Horizon(X,Y,minHorizon);
            end
        end
        if(count==N)
            fitness(number,1)=Areas/(X_max*max(Y));
%             disp(['�ɹ�ƴ�ӣ�Rate=',num2str(fitness(number,1))]);
%             disp(['Areas=',num2str(Areas),' X_max=',num2str(X_max)]);
%             disp(['max(Y)=',num2str(max(Y))]);
            break;
        end
    end
end
end

