% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

I = imread('candy.jpg'); % Load a synthetic mask
k = [];  
while isempty(k)
    figure(1)
    imshow(I); title("Select a candy");
    [x,y] = ginput(1);
    %Rounding coordinate for further operation
    x = round(x);
    y = round(y);
    % Extract the individual red, green, and blue color channels.
    redChannel = I(:, :, 1);
    greenChannel = I(:, :, 2);
    blueChannel = I(:, :, 3);
    
    M = I;
    M(:,:,:)= 0;
    %Thresholding based on red green and blue channel

    for i = 1:3
        O = otsu(I(:, :, i));
        M(:,:,i) = I(:, :, i) < O;
    end
    mask = M(:,:,1)+M(:,:,2)+M(:,:,3);
    mask(mask > 1) = 1;
    mask = imfill(mask,'holes');
    SE = strel('disk',10);
    mask = imdilate(imerode(mask, SE), SE);
    L = bwlabel(mask); % Use connected components algorithm to label all components
    label_max = max(L(:)); % A trick to get all values present in matrix L
    %Getting index by coordinate 
    a = (L(y,x));
    if a == 0
        f = msgbox('No Candy selected','Error');
        pause(1)
    else
        k=1;
    end
end
%Dividing selected label into R G B channel and calculating means values
meanR(a) = mean(redChannel(L == a));
meanG(a) = mean(greenChannel(L == a));
meanB(a) = mean(blueChannel(L == a));
count = 0;
for i = 1:label_max
    % Getting means values of each label
    meanR(i) = mean(redChannel(L == i));
    meanG(i) = mean(greenChannel(L == i));
    meanB(i) = mean(blueChannel(L == i));
    % Calculating Euclidian distance over RGB color space
    distance(i) = round(sqrt(((meanR(a) -meanR(i))^2) + ((meanG(a) -meanG(i))^2)+((meanB(a) -meanB(i))^2)));
    % If distance is more than 30 probably is not the same color
    if distance(i) < 30
        result(i) = i;
    end
end
%Deleting 0 values from the array
result = result(result ~= 0);
%Creating a mask of only selected value
S=0;
for i = 1:numel(result)
    S = S + (L == result(i));
end
%Labelling the mask
S = bwlabel(S);
%Creating centroid into each label
stat = regionprops(S,'centroid');
%Show the result
figure(1)
imshow(I); 
hold on;
for i = 1: numel(stat)
    plot(stat(i).Centroid(1),stat(i).Centroid(2),'white O');title("Candy Found");
end
hold off;



