% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

A = imread('eagle.jpg');
B = rgb2gray(A);
%I can negate the image or (Lines 17)
%B = 255 -B;
imshow(B)
O = otsu(B)
%Due he background is lighter than the object it's easy to invert the pixels
%to select
B = B < O;


SE = strel('disk',6);
B = imerode(imdilate(B, SE), SE);
B = immask(A, B);
figure
imshow(B);