clear,clc;
%��ʼ������Ⱥ,����ÿ�������� 4 �ı��� 1-x 2-y 3-H 4-c
N=input('�����ʼ����Ⱥ�ĸ���');

������������������Ҫ�����ģ��������õ�ֱ������ķ�Χ������ⷶΧ
position=20*rand(2,N)-10;   %����λ����Ϣ

pbest=zeros(4,N);    %����ÿ��������ʷ����λ��
gbest=zeros(4,1);    %����Ⱥ��ʷ����λ��
fvalue=zeros(1,N);   %��¼ÿ��������ʷ���ŵĵ�fitness value
pfvalue=zeros(1,N);%��¼ÿ�����ӵ�ǰ�� fitness value
Vf=rand(2,N);   %��¼ÿ�����ӵ��ٶ�

%����ѭ������������������Ϊ10000
num=1;
��������4 �������������ܺ���������ĵ�������Ҳ���Ե���
while (num<100)
    
    %��ÿ�����Ӽ���fitness value
    %��鲢����ÿ�����ӵ���ʷ����λ��pbest
    ������������Ӧ�Ⱥ���ʹ���Ǳ����Ҫȫ��
    [fvalue pbest]=fitness(position,pbest,fvalue);
    
    %ѡ������Ⱥ�����ŵ���ʷλ��
    gbest=selectgbest(fvalue,pbest);
    
    ��������������º����Ǻ���ͨ�ģ�����и��õĿ��Ե���һ��
    %���㲢���¸������ӵĵ�λ�ã����ٶ�
    [position Vf]=updatep(position,Vf,pbest,gbest);
    num=num+1;
    disp(['��ǰ����������',num2str(num)]);
end
%�����һ�ν��и��£���������λ��
 [fvalue pbest]=fitness(position,pbest,fvalue);
 gbest=selectgbest(fvalue,pbest);

disp(['����Xλ���ǣ�',num2str(gbest(1,1))]);
disp(['����Yλ���ǣ�',num2str(gbest(2,1))]);

disp(['����Hλ���ǣ�',num2str(gbest(3,1))]);
disp(['����cŨ���ǣ�',num2str(gbest(4,1))]);
fvaluebest=max(fvalue);
disp(['���ź���ֵΪ��',num2str(fvaluebest)]);



