% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

A = rgb2gray(imread('bird.jpg'));
O = otsu(A);
A = A > O;

figure(1)
subplot(1,2,1);imagesc(A);colormap(gray);title("Original");

SE = strel('disk',10);
A= imerode(imdilate(A, SE), SE);

subplot(1,2,2);imagesc(A);colormap(gray);title("Processed");