clc;
clear all;
close all;

w=[ 0 0 1 0 0;0 1 0 0 0;0 0 1 0 0;0 1 0 0 0;0 0 1 0 0 ];
left=zeros(5,1);
btm=zeros(5,1);
for i=1:5
   left(i)=sum(w(i,:));
end
for j=1:5
    btm(j)=sum(w(:,j));
end
I=find(left==max(left));
J=find(btm==max(btm));
w=zeros(5,5);
if size(I)>=1
   w(I,:)=ones(1,5);
end
if size(J)>=1
   w(:,J)=ones(5,1);
end