% CS391L Machine Learning HW1
% Name: Anna Mengjie Yu
% Email: annayu2010@gmail.com
% UTEID: my3852
% Date: 2016/1/31

% This code tests different combination of ks and training image numbers on
% the effect of prediction accuracy. Top 100 eigenvectors were selected in this experiment.
%The result is written to a table k_imageNum_result

%load data
load_data

% tried parameters
ks = [1, 5, 10, 20, 40, 100];
ImageNums = [500, 1000, 2000,4000,8000,20000,40000];

% initiaze the k_imageNum_result table
k_imageNum_result = zeros(length(ks),length(ImageNums))

for i=1:length(ImageNums)
    
    ImageNum = ImageNums(i);
    random_index = randi(60000,ImageNum,1);
    trainImages_set = trainImages(:,random_index);
    [m,V] = hw1FindEigendigits(trainImages_set);
    % take the top 100 eigenvectors, thus x by T
    V = V(:,1:100);
    
    % project the train/test samples on to the eigenbasis
    trainImages_p = V' * (double(trainImages) - repmat(m,1,60000));
    testImages_p = V' * (double(testImages) - repmat(m,1,10000));
    
    for j=1:length(ks)
        
        k = ks(j);

        % run KNN to get to predict the labels.
        % evaluate the test samples using N training samples
        [D, I] = pdist2(trainImages_p(:,1:ImageNum)',testImages_p','euclidean','Smallest',k);
        
        if k == 1 %do not need to vote
            predict = double(trainLabels(I));
        else 
            % vote for the most frequent predicted digit
            predict = mode(double(trainLabels(I)));
        end
            
        % estimate the accuracy
        k_imageNum_result(j,i) = sum(predict - double(testLabels) ==0) / 10000
    end
end

save k_imageNum_result;