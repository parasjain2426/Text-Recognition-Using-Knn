function[pracset]=nice()
x=imread('ABC.jpg');
%K = imresize(x,[20 15]);
BW1 = im2bw(x,0.4);
imshow(BW1)
BW=~(BW1);
[l,w]=bwlabel(BW);
bbox=regionprops(BW,'BoundingBox');
imshow(BW)
hold on
for i=1:length(bbox)
    curbb=bbox(i).BoundingBox;
    rec=rectangle('Position',[curbb(1),curbb(2),curbb(3),curbb(4)],'EdgeColor','r','LineWidth',2);
end
hold off
subImage = cell( 1, length(bbox) );
for i=1:length(bbox)
    subImage{i} = imcrop(BW, bbox(i).BoundingBox);
    subImage{i} = imresize(subImage{i},[20 15]);
end
p=cell2mat(subImage);
p=sum(p);
i=1;
w=1;
q=15;
w1=1;
q1=15;
 for j=1:15
     if q<=size(p,2)
  pracset(i,w1:q1)=p(:,w:q);
  w=w+15;
  q=q+15;
  i=i+1;
     else
         break
     end
 end
end