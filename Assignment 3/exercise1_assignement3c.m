% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

A = imread('bird.jpg');
B = rgb2gray(A);
O = otsu(B);
B = B > O;


SE = strel('disk',10);
B = imerode(imdilate(B, SE), SE);
B = immask(A, B);
imshow(B);