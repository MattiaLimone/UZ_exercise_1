% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

M = logical(imread('mask.png')); % Load a synthetic mask
SE = ones(3); % 3x3 structuring element (also try out different sizes and shapes)
figure(1);
subplot(1, 4, 1);
imagesc(imerode(M, SE)); axis equal; axis tight; title('Erode');
subplot(1, 4, 2);
imagesc(imdilate(M, SE)); axis equal; axis tight; title('Dilate');
subplot(1, 4, 3);
imagesc(imerode(imdilate(M, SE), SE)); axis equal; axis tight; title('Dilate & Erode');
subplot(1, 4, 4);
imagesc(imdilate(imerode(M, SE), SE)); axis equal; axis tight; title('Erode & Dilate');

SE = strel('disk',3); %DISK OF 15 RADIUS
figure(2);
subplot(1, 4, 1);
imagesc(imdilate(M, SE)); axis equal; axis tight; title('Dilate');
subplot(1, 4, 2);
imagesc(imerode(M, SE)); axis equal; axis tight; title('Erode');
subplot(1, 4, 3);
imagesc(imdilate(imerode(M, SE), SE)); axis equal; axis tight; title('Erode & Dilate');
subplot(1, 4, 4);
imagesc(imerode(imdilate(M, SE), SE)); axis equal; axis tight; title('Dilate & Erode');