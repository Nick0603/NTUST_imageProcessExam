clear all;clc;close all
imgOrigin = imread('cats.jpg');

imgGray = rgb2gray(imgOrigin);
[rows,cols] = size(imgGray);
pTotal = rows*cols;
pValArr = zeros(1,256);
minValue = 255 + 1;
maxValue =   0 - 1;

for r=1:rows
    for c=1:cols
        pValue = imgGray(r,c);
        pValArr(1,pValue+1) = pValArr(pValue+1)  + 1;
        if pValue < minValue
            minValue = pValue;
        end
        if pValue > maxValue
            maxValue = pValue;
        end
    end
end

pValPercentArr = zeros(1,256);
count = 0;
for i=1:256
    count = count + pValArr(i);
    pValPercentArr(i) = double(count)/double(pTotal);
end

imgGrayEq = imgGray;%copy image
disDiv = double(maxValue-minValue+1);
pRseultValArr = zeros(1,256);
eqDistance = 3; %  set by myself
for r=1:rows
    for c=1:cols
        pValue = imgGray(r,c);
        pPercent = pValPercentArr(pValue);
        pEqValue = floor(pPercent*255);
        pEqValue = pEqValue - mod(pEqValue,eqDistance);
        imgGrayEq(r,c) = pEqValue;
        pRseultValArr(1,pEqValue+1) = pRseultValArr(pEqValue+1)  + 1;
    end
end

subplot(2,2,1),imshow(imgGray),title('Original');
subplot(2,2,2),stem(pValArr),title('imhist');
subplot(2,2,3),imshow(imgGrayEq),title('histeq');
subplot(2,2,4),stem(pRseultValArr),title('imhist');

