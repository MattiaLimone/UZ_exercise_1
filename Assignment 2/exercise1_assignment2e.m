% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

A1 =double(rgb2gray(imread('photo/photo1.jpg')));
A2 =double(rgb2gray(imread('photo/photo2.jpg')));
A3 =double(rgb2gray(imread('photo/photo3.jpg')));
A4 =double(rgb2gray(imread('photo/photo4.jpg')));

nbins = 25;
MyHist1 = myhist(A1, nbins);
MyHist2 = myhist(A2, nbins);
MyHist3 = myhist(A3, nbins);
MyHist4 = myhist(A4, nbins);

figure(1)
subplot(1,4,1); bar(MyHist1); title('myhist photo1 25 bins');
subplot(1,4,2); bar(MyHist2); title('myhist photo2 25 bins');
subplot(1,4,3); bar(MyHist3); title('myhist photo3 25 bins');
subplot(1,4,4); bar(MyHist4); title('myhist photo4 25 bins');

nbins = 50;
MyHist1 = myhist(A1, nbins);
MyHist2 = myhist(A2, nbins);
MyHist3 = myhist(A3, nbins);
MyHist4 = myhist(A4, nbins);

figure(2)
subplot(1,4,1); bar(MyHist1); title('myhist photo1 50 bins');
subplot(1,4,2); bar(MyHist2); title('myhist photo2 50 bins');
subplot(1,4,3); bar(MyHist3); title('myhist photo3 50 bins');
subplot(1,4,4); bar(MyHist4); title('myhist photo4 50 bins');

nbins = 100;
MyHist1 = myhist(A1, nbins);
MyHist2 = myhist(A2, nbins);
MyHist3 = myhist(A3, nbins);
MyHist4 = myhist(A4, nbins);

figure(3)
subplot(1,4,1); bar(MyHist1); title('myhist photo1 100 bins');
subplot(1,4,2); bar(MyHist2); title('myhist photo2 100 bins');
subplot(1,4,3); bar(MyHist3); title('myhist photo3 100 bins');
subplot(1,4,4); bar(MyHist4); title('myhist photo4 100 bins');

nbins = 200;
MyHist1 = myhist(A1, nbins);
MyHist2 = myhist(A2, nbins);
MyHist3 = myhist(A3, nbins);
MyHist4 = myhist(A4, nbins);

figure(4)
subplot(1,4,1); bar(MyHist1); title('myhist photo1 200 bins');
subplot(1,4,2); bar(MyHist2); title('myhist photo2 200 bins');
subplot(1,4,3); bar(MyHist3); title('myhist photo3 200 bins');
subplot(1,4,4); bar(MyHist4); title('myhist photo4 200 bins');