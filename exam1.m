clear all;clc;close all
imgOrigin = imread('cats.jpg');

imgHSV = rgb2hsv(imgOrigin)
[rows,cols] = size(imgHSV);
distance = floor(rows/3)
imgHUp =     imgHSV(distance*0 + 1:distance*1,:,1);
imgHMid =    imgHSV(distance*1 + 1:distance*2,:,1);
imgHBottom = imgHSV(distance*2 + 1:distance*3,:,1);

imgHUpPlus60 = imgHUp(:,:,1)+60/360;
imgHUpPlus60 = mod(imgHUpPlus60,1);

imgHMidPlus180 = imgHMid(:,:,1)+180/360;
imgHMidPlus180 = mod(imgHMidPlus180,1);

imgHBottomPlus300 = imgHBottom(:,:,1)+300/360;
imgHBottomPlus300 = mod(imgHBottomPlus300,1);

imgHSV(distance*0 + 1:distance*1,:,1) = imgHUpPlus60;
imgHSV(distance*1 + 1:distance*2,:,1) = imgHMidPlus180;
imgHSV(distance*2 + 1:distance*3,:,1) = imgHBottomPlus300;
result = hsv2rgb(imgHSV);

subplot(1,2,1),imshow(imgOrigin),title('Original');
subplot(1,2,2),imshow(result),title('Rseult');
