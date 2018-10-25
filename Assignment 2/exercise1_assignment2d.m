% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

GRAY = double(rgb2gray(imread('umbrellas.jpg'))); %Read image and converting to matrix Converting into grayscale
nbins=25; %Number of bins for the first test
% reshape image in 1D vector prod(size(GRAY))=Number of array elements
% equivalent to numel(GRAY)
H1 = GRAY(:);  
H2 = hist(H1,nbins);
H3 = myhist(GRAY, nbins);

figure(1)
subplot(1,2,1); bar(H2); title('histogram 25 bins');
subplot(1,2,2); bar(H3); title('myhist 25 bins');

GRAY = double(rgb2gray(imread('eagle.jpg'))); %Read image and converting to matrix converting into grayscale
nbins=25; %Number of bins for the first test
% reshape image in 1D vector prod(size(GRAY))=Number of array elements
% equivalent to numel(GRAY)
H1 = reshape(GRAY, 1, prod(size(GRAY)));  
H2 = histo(H1,nbins);
H3 = myhist(GRAY, nbins);

figure(2)
subplot(1,2,1); bar(H2); title('histogram 25 bins');
subplot(1,2,2); bar(H3); title('myhist 25 bins');