function [to_visitFlag,to] = panDuanCity(n,J,endnode,to_visit,Time,TimeEnd,PathEndTime,Eta,Tau,visited,NC,NC_max)
%�ж��ܷ�ѡ����һ���� ���ܷ��� 1 ���� ���� 0
% to Ϊ�ܷ��ʵĳ��е����,�Ѿ����� ʣ�µ� ���е�
% J Ϊ���� i δ���� ���� jn      Time Ϊʱ���  endnode ΪĿǰ·�����һ����  
% PathEndTime ��ǰ·���ѷ�ʱ�� 1��ֵ
lastTime=Time(endnode,to_visit)+PathEndTime;
if TimeEnd(to_visit,1)>lastTime   %ʱ���ԣ
    to_visitFlag=1;
    to=to_visit;
else  %�õ㲻��  ����ʣ�µĵ�
    NoNode=J;
    index=find(NoNode==to_visit);
    NoNode(index)=0;
    %����ȷ�� ����i δ���ʵĳ��е����
    jn=length(J);
    for i=1:jn   %������ jn ��ʣ��ĵ㣬���ܷ��ҵ��ʺϵ�
         jn=1;
         for k=1:n   
             if length(find(NoNode==k))==0 %û���ʵĶ�����
                 NoNode(jn)=k;
                 jn=jn+1;
             end
         end
       zi_to_visit=select_nextCity(J,visited,Eta,Tau,NC,NC_max);  
       if TimeEnd(zi_to_visit)>lastTime   %ʱ���ԣ
              to_visitFlag=1;
              to=zi_to_visit;
              break;
       else
        to_visitFlag=0;
        to=-1;
    end
       end

    end
    
end

