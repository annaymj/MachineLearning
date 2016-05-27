
% Test SVM with no kernel functions

load_data

% Test SVM accuracy using different number of training images
ImageNums = [500, 1000, 2000,4000,8000,20000];

% initiaze the svm_rawDigit_Ns table
svm_rawDigit_Ns2 = zeros(1,length(ImageNums))

for i=1:length(ImageNums)
    
    ImageNum = ImageNums(i);
    subset_trainImages = double(trainImages(:,1:ImageNum));
    subset_trainLabels = double(trainLabels(:,1:ImageNum));
 
   % Build multi-class SVM classifier with no kernal function
    Mdl = fitcecoc(subset_trainImages',subset_trainLabels');

    % predict test images
    testImages = double(testImages);
    predicted_labels = predict(Mdl, testImages');

    trueLabels = testLabels';
    accuracy = sum(double(predicted_labels) - double(trueLabels) ==0)/10000;
    svm_rawDigit_Ns2(i) = accuracy
end

save svm_rawDigit_Ns2;