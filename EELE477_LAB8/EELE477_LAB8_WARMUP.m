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
%-1 black, 1 white

xpix_2 = ones(1,400);
