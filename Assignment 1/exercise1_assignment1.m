% Author: Mattia Limone
% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

A = imread('umbrellas.jpg'); %Read image and converting to matrix

figure(1) %Subplot to compare them
subplot(1,2,1); imshow(A); title('IMSHOW'); %Imshow command
subplot(1,2,2); imagesc(A); title('IMAGESC'); %Imagesc command

Ad = double(A); % division operation not defined for uint8
[h,w,d] = size(A) % output the size of the image 
A_gray = uint8((Ad(:,:,1) + Ad(:,:,2) + Ad(:,:,3)) / 3.0);

figure(2);imshow(A_gray); title('GRAY SCALE'); %Show gray scale

figure(3)
subplot(1,3,1); subimage(A_gray,jet); title('JET COLORMAP');%JET COLORMAP
subplot(1,3,2); subimage(A_gray,bone); title('BONE COLORMAP');%BONE COLORMAP
subplot(1,3,3); subimage(A_gray,gray); title('GRAY COLORMAP');%GRAY COLORMAP

h1 = (h/2); %Calculate half height
w1 = (w/2); %Calculate half width

%SINCE THE IMAGE IS CONVERTED TO A MATRIX WITH imread THERE IS NO NEED
%TO USE OTHER VARIABLES TO CROP IT, IT IS EASIER TO USE MATRIX PROPERTY
figure(4); imshow(A(1:h1,1:w1,:)); title('CROPPED IMAGE');

A2 = A; %Saving a copy to change blue channel
A2(1:h1,1:w1,3) = 0; %Changing the blue channel of the cropped part in the original image to 0
figure(5); imshow(A2); title('CROPPED PART WITH BLUE CHANNEL AT 0');

B = A(1:h1,1:w1,:); %Isolating the cropped part
B = rgb2gray(B); %Grayscale of the cropped part
B = 255 - B; %Negative grayscale of the croppedpart

A(1:h1,1:w1,1) = B; %Copying value into red channel
A(1:h1,1:w1,2) = B; %Copying value into green channel
A(1:h1,1:w1,3) = B; %Copying value into blu channel
figure(6); imshow(A); title('COMPLEMENTARY OF GRAYSCALE CROPPED IMAGE');


A_thr = A_gray > 150; % elements with value > 150 are set to 1, others to 0
figure(7); imagesc(A_thr); colormap(gray); title('Thresholded binary image'); %changing colormap



ADOUBLE = im2double(imread('umbrellas.jpg'));%Convert the umbrellas to double
GRAYDOUBLE = rgb2gray(ADOUBLE); %Convert to grayscale
GRAYDOUBLE64 = GRAYDOUBLE/4; %Changing grayscale to 64-0 (256 levels/4)
GRAYDOUBLE64 = round(GRAYDOUBLE64,3); %Rounding the result to the nearest 3 decimal digits.

figure(8)
subplot(1,2,1); imshow(GRAYDOUBLE64); title('IMSHOW LV 0-64');
subplot(1,2,2); imagesc(GRAYDOUBLE64); title('IMAGESC LV 0-64'); colormap(gray);

