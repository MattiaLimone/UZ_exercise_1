% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

A = double(rgb2gray(imread('bird.jpg')));
M = A > 55 ; 
figure(1);
imagesc(M);colormap(gray);

H1 = myhist(A, 10); %Myhist with 10 bins
H2 = myhist(A, 20); %Myhist with 20 bins
H3 = myhist(A, 40); %Myhist with 40 bins

figure(2)
subplot(1,3,1); bar(H1); title('10 bins');
subplot(1,3,2); bar(H2); title('20 bins');
subplot(1,3,3); bar(H3); title('40 bins');

P = A(:);
figure(3); clf;
bins = 10 ;
H = hist(P, bins);
subplot(1,3,1); bar(H, 'b'); title('10 bins');
bins = 20 ;
H = hist(P, bins);
subplot(1,3,2); bar(H, 'b'); title('20 bins');
bins = 40 ;
H = hist(P, bins);
subplot(1,3,3); bar(H, 'b'); title('40 bins');
