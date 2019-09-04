clc;
clear all;
close all;
X =im2double(imread('build_IGARSS2_512_512.jpg'));
k = [1 2 1; 0 0 0; -1 -2 -1];
H = conv2(X,k, 'same');
V = conv2(X,k','same');
E = sqrt(H.*H + V.*V);
E=(E<=1).*E+(E>1)*1;
E=E>.4;
M= bwareaopen(E,40);
I=X;
[r,c]=size(X);
for i=3:r-2
    for j=3:c-2
        mask=X(i-2:i+2,j-2:j+2);
        md=mode(mask(:));
        mask1=(mask>md);
        e=entropy(mask1);
        if e>0.8
            I(i,j)=mean2(mask);
            %if md>I(i,j)
            %I(i,j)=I(i,j)-0.5*abs(md-I(i,j));
            %else
             % I(i,j)=I(i,j)+0.5*abs(md-I(i,j));
            %end
        else
           % I(i,j)=md;
        end
    end
end
I=I.*(1-M);
I=I+X.*(M);
figure,imshow(I);