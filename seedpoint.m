function [List1,List2]=seedpoint(R)
global List1;
global List2;
global k;
global T1;
global v;

k=k+1;
md=mode(R(:,3));
[x y]=size(R);
sum=0;
for i=1:x
    sum=sum+(md-R(i,3))^2;
end

sum=sum/x;
st=sqrt(sum);

if st>T1 %&& x>50
    temp=(R(:,3)>= md-v*st & R(:,3)<=md+v*st);
    xr=(R(:,1).*temp);xr = xr(xr ~= 0);
    yr=(R(:,2).*temp);yr = yr(yr ~= 0);
    gr=(R(:,3).*temp);gr = gr(gr ~= 0);
    
   List1=[List1;[xr,yr,gr]];
   List2(k,1)=md;
   List2(k,2)=length(xr);
   temp2=(R(:,3)< md-v*st);
   xr2=(R(:,1).*temp2);xr2 = xr2(xr2 ~= 0);
   yr2=(R(:,2).*temp2);yr2 = yr2(yr2 ~= 0);
   gr2=(R(:,3).*temp2);gr2 = gr2(gr2 ~= 0);
   
   temp3=(R(:,3)> md+v*st);
   xr3=(R(:,1).*temp3);xr3 = xr3(xr3 ~= 0);
   yr3=(R(:,2).*temp3);yr3 = yr3(yr3 ~= 0);
   gr3=(R(:,3).*temp3);gr3 = gr3(gr3 ~= 0);
   R2=[xr2,yr2,gr2];
   R3=[xr3,yr3,gr3];
   seedpoint(R2);
   seedpoint(R3);
else 
    return;
end
return ;
end

