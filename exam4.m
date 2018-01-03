clear all;clc;close all
imgOrigin = imread('cats.jpg');

imgYcBcr = rgb2ycbcr(imgOrigin);
[rows,cols,n] = size(imgYcBcr);
LoopStep = 3;
DisSideToCenter = 1;% pixCountFromSizeTocenter
for r=1:LoopStep:rows-LoopStep+1 %avold the extend array size
    for c=1:LoopStep:cols-LoopStep+1 %avold the extend array size
        for x=r:r+LoopStep-1
            for y=c:c+LoopStep-1
                imgYcBcr(x,y,2) = imgYcBcr(r+DisSideToCenter,c+DisSideToCenter,2);
                imgYcBcr(x,y,3) = imgYcBcr(r+DisSideToCenter,c+DisSideToCenter,3);
            end
        end
    end
end
img911 = ycbcr2rgb(imgYcBcr);
img911d = reshape(double(img911),numel(img911),1);
imgd = reshape(double(imgOrigin),numel(imgOrigin),1);
Diff911 = sum(abs(img911d./norm(img911d)-imgd/norm(imgd)));
fprintf(1,'9:1:1 Difference = %f\n',Diff911);
t = sprintf('4:1:1 Difference = %f\n',Diff911);

subplot(2,1,1),imshow(imgOrigin);title('Original');
subplot(2,1,2),imshow(img911);title('9:1:1');
text(0,size(imgOrigin,1)+70,t);