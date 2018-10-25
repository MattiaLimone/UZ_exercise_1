% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

I = imread('coins.jpg'); % Load a synthetic mask
M = rgb2gray(I);
O = otsu(M);
M = M < O;
SE = strel('disk',6);
M = imerode(imdilate(M, SE), SE);
figure(1)
imshow(M);

L = bwlabel(M); % Use connected components algorithm to label all components
label_max = max(L(:)); % A trick to get all values present in matrix L
for i = 1:label_max
if sum(L(:) == i) > 700 % Only process labels that have more than 700 pixels
L(L == i) = 0;
end
end
figure(2)
subplot(1, 2, 1);
imshow(I); title('Original');
subplot(1, 2, 2);
imshow(immask(I, L > 0)); title('Processed'); % Display the result (if you have not written immask?-function then simply display the mask)
colormap gray;


L2 = bwlabel(L); % Use connected components algorithm to label all components
label_max = max(L2(:)); % A trick to get all values present in matrix L2
figure(3)
for i = 1:label_max 
    subplot(2,3,i); imshow(immask(I , L2 == i)); title(sprintf('Label #%d',i));
end
figure(4)
for i = 1:label_max 
    subplot(2,3,i); imshow(L2 == i); title(sprintf('Label Mask #%d',i));
end

