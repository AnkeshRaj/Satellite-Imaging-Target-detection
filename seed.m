function [List1,List2]=seed(I)
 
global List1;
global List2;
global k;
global T1;
global v;
T1=2.8;
v=0.3;
k=0;

[x,y]=find(I>=0);
g=I(:);
R=[x,y,g];
[List1,List2]=seedpoint(R);

end
