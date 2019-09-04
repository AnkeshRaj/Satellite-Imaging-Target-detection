clc;
clear all;
close all;
X =(imread('MSRA_1_gray.jpg'));
X=im2double(X);
[x,y]=size(X);
Mask=zeros(x,y);

B = bfilter2(X);
figure,imshow(B);

for i=3:x-2
    for j=3:y-2
        mat=B(i-2:i+2,j-2:j+2);
        mn=mean2(mat);
        mat=mat-mn;
        mat=mat.*mat;
        Mask(i,j)=sum(mat(:));
    end
end
Mask=Mask(3:x-2,3:y-2);
Mask=padarray(Mask,[2 2],'replicate','both');
Mask=im2uint8(Mask);
a = min(Mask(:)); 
b = max(Mask(:)); 
Mask= (Mask-a).*(255/(b-a));

figure,imshow(Mask);

[clusters, result_image,clusterized_image] = kmeansclustering(im2uint8(Mask), 3);
k=2; 
E=clusterized_image~=k;

[x,y]=size(E);
 
  
 figure,imshow(E);
 
 E= bwareaopen(E,70);
 
 figure,imshow(E);
 
 E=bwmorph(E,'thin');
 E= bwareaopen(E,70);
 E=bwmorph(E,'thin',5);
 figure,imshow(E);
%% 
%  temp=List1(1:List2(1,2),3)==List2(1,1);
%  Xc=(List1(1:List2(1,2),1).*temp);Xc=Xc(Xc ~= 0);
%  Yc=(List1(1:List2(1,2),2).*temp);Yc=Yc(Yc ~= 0);
%  for i=2:length(List2)
%     temp=List1(List2(i-1,2)+1:List2(i-1,2)+List2(i,2),3)==List2(i,1);
%     x1=(List1(List2(i-1,2)+1:List2(i-1,2)+List2(i,2),1).*temp);x1=x1(x1 ~= 0);
%     y1=(List1(List2(i-1,2)+1:List2(i-1,2)+List2(i,2),2).*temp);y1=y1(y1 ~= 0);
%     Xc=[Xc;x1];
%     Yc=[Yc;y1];
%  end
%  
%  for i=1:length(Xc)
%     Igv(i)= Mask(Xc(i),Yc(i));
%  end
%  Mn=mean(Igv);
%  Igv=(Igv-Mn).^2;
%  VS=sum(Igv);
%  VS=VS/length(Xc);
% imshow(Mask>=VS-300&Mask<=VS+300);