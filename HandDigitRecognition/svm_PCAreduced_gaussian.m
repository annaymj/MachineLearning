
% CS391L Machine Learning HW4
% Name: Anna Mengjie Yu
% Email: annayu2010@gmail.com
% UTEID: my3852
% Date: 2016/4/5

load_data

vectorNums = [10, 50, 100, 200, 300, 400, 600, 782];
ImageNums = [4000];

% initialize the svm_PCADigit_Ns_Vs table
svm_PCADigit_Ns_Vs = zeros(1,length(vectorNums))


for i=1:length(ImageNums)
    
    ImageNum = ImageNums(i);
    sub_trainImages = double(trainImages(:,1:ImageNum));
    trainLabels = double(trainLabels);
    %subset_trainLabels = double(trainLabels(:,1:ImageNum));
    [m,matrixV] = hw1FindEigendigits(sub_trainImages);
    
    for j=1:length(vectorNums)
        V = matrixV(:,1:vectorNums(j));

        % project the train/test samples on to the eigenbasis
        trainImages_p = V' * (double(trainImages) - repmat(m,1,60000));
        testImages_p = V' * (double(testImages) - repmat(m,1,10000));
        
        % Build SVM template
        t = templateSVM('KernelFunction','gaussian','KernelScale','auto');
        
        % Build multi-class SVM classifier with corresponding kernal function
        Mdl_PCA_kernel = fitcecoc(trainImages_p',trainLabels', 'Learners',t);

        % predict test images
        testImages_p = double(testImages_p);
        predicted_labels = predict(Mdl_PCA_kernel, testImages_p');

        trueLabels = testLabels';
        accuracy = sum(double(predicted_labels) - double(trueLabels) ==0)/10000;
        svm_PCADigit_Ns_Vs(i,j) = accuracy
    end
end
save svm_PCADigit_Ns_Vs;
        
 

 
      
 
 
 
 
 