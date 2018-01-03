clear all;clc;close all
imgOrigin = imread('cats.jpg');

imgB = imgOrigin(:,:,1)
[rows,cols] = size(imgB);
imgNewB = imgOrigin(:,:,1)%copy B channel
for r=1:rows
    for c=1:cols
        x = imgB(r,c);
        if x<80
            x = 2*x + 20;
        elseif x< 160
            x = 1.2*x + 30;
        else
            x = 0.8*x - 10;
        end
        imgNewB(r,c) = x;
    end
end
rseult = imgOrigin; %copy image
rseult(:,:,1) = imgNewB;
subplot(2,2,1),imshow(imgOrigin),title('Original');
subplot(2,2,2),imshow(rseult),title('Rseult');
subplot(2,2,3),imhist(imgB),title('Before B');
subplot(2,2,4),imhist(imgNewB),title('After B');
