% CS391L Machine Learning HW1
% Name: Anna Mengjie Yu
% Email: annayu2010@gmail.com
% UTEID: my3852
% Date: 2016/1/31

% This code tests different combination of ks and topN eigenvector numbers on
% the effect of prediction accuracy. 4000 training images were selected in this experiment.
%The result is written to a table k_vectorNum_result

%load data
load_data

% tried parameters
ks = [1, 5, 10, 20, 40, 100];
vectorNums = [10, 50, 100, 200, 300, 400, 500, 600, 700, 782];
ImageNum = 4000;

random_index = randi(60000,ImageNum,1);
trainImages_set = trainImages(:,random_index);
[m,matrixV] = hw1FindEigendigits(trainImages_set);

% initiaze the k_imageNum_result table
k_vectorNum_result = zeros(length(ks),length(vectorNums))

for i=1:length(vectorNums)
    
    % take the top T eigenvectors, thus x by T
    V = matrixV(:,1:vectorNums(i));
    
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
        k_vectorNum_result(j,i) = sum(predict - double(testLabels) ==0) / 10000
    end
end

save k_vectorNum_result;
