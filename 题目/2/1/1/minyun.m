clc,clear
%a Ϊʣ������x ��������9
k=0;
z=[];
for ax=0:5 %a��������120�ĳ���
    for bx=5:0 %b��������120�ĳ���
        for m=0:5 %a��������150�ĳ���
            for n=5:0 %b��������150�ĳ���
                for a=0:76 %a����ʣ����
                    for b=76:0 %b����ʣ����
                p=660-120*x-150*m-a;%a���ص�һ�����ͺ��ʣ����
                q=550-120*y-150*n-b; %b
                w=620-120*(5-x-y)-150*(5-m-n)-(76-a-b); %c
                if (p>120&&m>0)||(x==0)
                    e=ceil(p/150);
                else
                    e=ceil(p/120);
                end
                if (q>120&&n>0)||(y==0)
                    f=ceil(q/150);
                else
                    f=ceil(q/120);
                end
                if (w>120&&(5-m-n)>0)||(5-x-y==0)
                    g=ceil(w/150);
                else
                    g=ceil(w/120);
                end
                k=k+1;
                z(k)=e+f+g;
                    end
                end
            end
        end
    end
end
h=min(z)              
                    
