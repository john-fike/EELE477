clear; clc; close all;

load lighthouse.mat
colormap(gray(256));
show_img(xx,1,256,gray);
ww200 = xx(200,:);
figure();
plot(ww200);  %0 to 1

xpix = ones(256,1)*cos(2*pi*(0:255)/16);
show_img(xpix,3,256,gray);
ww400 = xpix(200,:);
figure()
plot(ww400);
%0 black, 1 white

%image with 5 horizontal lines
xpix_2 = ones(1,400).*(cos(2*pi*(0:400)/80)).';
show_img(xpix_2,4,256,gray);

p = 2;
wp = xx(1:p:end,1:p:end);
show_img(wp,5,256,gray);
