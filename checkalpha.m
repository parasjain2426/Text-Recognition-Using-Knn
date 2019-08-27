clear all;
clc;
x=load('checkalphatrainfinal.txt');
x1=x(:,1:end-1);
x2=x(:,end);
[y1]=nice();
knn=8;
k=1;
for i=1:size(y1,1)
    for j=1:size(x1,1)
        res=y1(i,:)-x1(j,:);
        p=res.^2;
        p=sum(p);
        p=sqrt(p);
        list(k,:)=[p];
         k=k+1;
    end
     size(list);
    k=1;
    list=[list x2];
    list=sortrows(list,1)
    if knn==1
      predicted(i,:)=[list(1,2)];
    else
        predicted(i,:)=[mode(list(knn,2))];
    end
    list=0;
end