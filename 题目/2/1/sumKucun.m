%������fenleiAnd�������˵������� a b c �ĺ���%����  ÿ��������ܺͣ�����Ա�
xuA=ad;
la=length(ad);
sumdemand=0;
for i=1:la
    indexa=xuA(i);
    sumdemand=sumdemand+demand(indexa);
end
disp(['A�� ����Ҫ��',num2str(sumdemand)]);

xuB=bd;
la=length(bd);
sumdemand=0;
for i=1:la
    indexa=xuB(i);
    sumdemand=sumdemand+demand(indexa);
end
disp(['B�� ����Ҫ��',num2str(sumdemand)]);

xuC=cd;
la=length(cd);
sumdemand=0;
for i=1:la
    indexa=xuC(i);
    sumdemand=sumdemand+demand(indexa);
end
disp(['C�� ����Ҫ��',num2str(sumdemand)]);