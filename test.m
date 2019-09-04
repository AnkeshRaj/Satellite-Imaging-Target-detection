clc;
close all;
clear all;
eI = im2double((imread('build_IGARSS2_512_512.jpg')));
% X=X(1:250,1:250); 

eI  = Direc_Morph( eI );
% imtool(eI);
 k = [1 2 1; 0 0 0; -1 -2 -1];
 H = conv2(eI,k, 'same');
 V = conv2(eI,k','same');
 E = sqrt(H.*H + V.*V);
 E=(E<=1).*E+(E>1)*1;
 E=E>.54;
 E= bwareaopen(E,70);
 E=bwmorph(E,'thin');
 E= imrotate(E,33,'crop');
% [H,T,R] = hough(E);
% P  = houghpeaks(H,200,'threshold',ceil(0.000001*max(H(:))));
% 
% figure,imshow(E),title('Edge Profile of Image');
% [H,T,R] = hough(E);
% lines = houghlines(E,T,R,P,'FillGap',7,'MinLength',5);
% figure, imshow(E), hold on
% max_len = 0;
% for k = 1:length(lines)
%    xy = [lines(k).point1; lines(k).point2];
%    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% 
%    % Plot beginnings and ends of lines
%    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% 
%    % Determine the endpoints of the longest line segment
%    len = norm(lines(k).point1 - lines(k).point2);
%    if ( len > max_len)
%       max_len = len;
%       xy_long = xy;
%    end
% end
% se1=[-2 0 2 2 0 -2;-2 0 2 2 0 -2;-2 0 2 2 0 -2;-2 0 2 2 0 -2;-2 0 2 2 0 -2];
% se2=se1';
% se3=[-1 1 1 -1 0;-1 1 1 -1 -1;-1 1 1 1 1 ;-1 1 1 1 1;-1 -1 -1 -1 -1];
% se4=se3';
% se5=[0 -1 1 1 -1;-1 -1 1 1 -1;1 1 1 1 -1 ;1 1 1 1 -1 ;-1 -1 -1 -1 -1 ];
% se6=[-1 -1 -1 -1 -1;-1 1 1 1 1;-1 1 1 1 1;-1 1 1 -1 -1;-1 1 1 -1 0];
% H1 = conv2(eI,se1, 'same');
% H2 = conv2(eI,se2, 'same');
% H3 = conv2(eI,se3, 'same');
% H4 = conv2(eI,se4, 'same');
% H5 = conv2(eI,se5, 'same');
% H6 = conv2(eI,se6, 'same');
% 
% figure,imshow(H1);
% figure,imshow(H2);
% figure,imshow(H3);
% figure,imshow(H4);
% figure,imshow(H5);
% figure,imshow(H6);
% 
% H12=H1>0.46;
% H22=H2>0.46;
% H32=H3>0.46;
% H42=H4>0.46;
% H52=H5>0.46;
% H62=H6>0.46;
% 
% B1 = bwareaopen(H12,70);
% B2 = bwareaopen(H22,70);
% B3 = bwareaopen(H32,70);
% B4 = bwareaopen(H42,70);
% B5 = bwareaopen(H52,70);
% B6 = bwareaopen(H62,70);
% B12=bwmorph(B1,'thin');
% B22=bwmorph(B2,'thin');
% B32=bwmorph(B3,'thin');
% B42=bwmorph(B4,'thin');
% B52=bwmorph(B5,'thin');
% B62=bwmorph(B6,'thin');
% figure,subplot(1,2,1),imshow(H12);subplot(1,2,2) ,imshow(B1);
% figure,subplot(1,2,1),imshow(H22);subplot(1,2,2) ,imshow(B2);
% figure,subplot(1,2,1),imshow(H32);subplot(1,2,2) ,imshow(B3);
% figure,subplot(1,2,1),imshow(H42);subplot(1,2,2) ,imshow(B4);
% figure,subplot(1,2,1),imshow(H52);subplot(1,2,2) ,imshow(B5);
% figure,subplot(1,2,1),imshow(H62);subplot(1,2,2) ,imshow(B6);
%  S=B62+B52+B42+B32;%+B2+B1;
% figure,imshow(S);
% S2 = bwmorph(S,'thin');
% figure,imshow(S2);
% [x,y]=size(X);
% Mask=zeros(x,y);
% for i=2:x-1
%     for j=2:y-1
%         mat=eI(i-1:i+1,j-1:j+1);
%         if max(max(mat))-min(min(mat))>0.29
%             Mask(i-1:i+1,j-1:j+1)=1;%imsharpen(mat);
%         end
%     end
% end
% Mask2=imclose(Mask,ones(2,2));
% Mask2=imfill(1-Mask,4,'holes');
% Mask2=1-Mask2;
% Mask2=imdilate(Mask2,ones(2,2));
% figure,imshow(Mask),title('Mask extracted from Edge Profile');
% 
% windowWidth = 4;
% kernel = ones(windowWidth) / windowWidth .^ 2;
% X2 = imfilter(X, kernel, 'replicate');
% R1 = X2.*(1-Mask)+imsharpen(X.*Mask,'Radius',0.22,'Amount',2);
% figure,imshow(R1),title('Enhanced Image');


%% firther work



% B = bfilter2(X,3,0.03);
% figure,imshow(B)=
% 
% X=im2uint8(X);
% B=im2uint8(eI);
% [x,y]=size(X);
% 
% B=im2uint8(eI);
% [x,y]=size(X);
% 
% Mask2=zeros(x,y);
% for i=3:x-2
%     for j=3:y-2
%         mat=B(i-2:i+2,j-2:j+2);
%        % mn=mean(mat(:));
%         md=median(mat(:));
%         mat=(mat<(md+5))&(mat>(md-5));%(mat<(mn+(mn-md)^2))&(mat>(mn-(mn-md)^2));
%         count=sum(mat(:));
%         if count>23
%             Mask2(i-2:i+2,j-2:j+2)=1;%B(i-2:i+2,j-2:j+2)+20;
%         end
%     end
% end
% figure,imshow(Mask2);
% 
% Mask3=1-Mask2;
% Mask4=Mask&Mask3;
% Mask5=Mask4&Mask;
% Mask6=Mask&Mask2;
% figure,imshow(Mask5+Mask6);
% % imtool(eI2);
% 
