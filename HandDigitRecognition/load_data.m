% CS391L Machine Learning HW1
% Name: Anna Mengjie Yu
% Email: annayu2010@gmail.com
% UTEID: my3852
% Date: 2016/1/31


% This is the main program. It first loads the data.
% Then carries out the experiments to test the effect of
% 1) Different number of training points
% 2) Different number of eigenvectors
% 3) Different number of Ks
% on the effect of prediction accuracy.

clear;
%load data
load digits.mat;

%reduce to three dimentions by removing singleton
trainImages = squeeze(trainImages);
testImages = squeeze(testImages);

%get size of Images
trainImages_size = size(trainImages);
pixel_train = trainImages_size(1,1) * trainImages_size(1,2);
trainImages_number = trainImages_size(1,3);

testImages_size = size(testImages);
pixel_test = testImages_size(1,1) * testImages_size(1,2);
testImages_number = testImages_size(1,3);


%reduce to 2 dimensions 
%The resulting matrix is x * k, where x is the total number of pixels in an
%image, and k is the number of images
trainImages = reshape(trainImages,pixel_train,trainImages_number);
testImages = reshape(testImages, pixel_test,testImages_number);




