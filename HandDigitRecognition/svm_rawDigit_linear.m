

% Test SVM with different kernel functions


load_data

% Test SVM accuracy using different number of training images
ImageNums = [500, 1000, 2000,4000,8000,20000];

% initialize the svm_rawDigit_Ns_Kernals table
svm_rawDigit_Ns_linear = zeros(1,length(ImageNums))

for i=1:length(ImageNums)
    
    ImageNum = ImageNums(i);
    subset_trainImages = double(trainImages(:,1:ImageNum));
    subset_trainLabels = double(trainLabels(:,1:ImageNum));
    
    
        % Build SVM template
        t = templateSVM('KernelFunction','linear');
        
        % Build multi-class SVM classifier with corresponding kernal function
        Mdl_kernel = fitcecoc(subset_trainImages',subset_trainLabels', 'Learners',t);
 

        % predict test images
        testImages = double(testImages);
        predicted_labels = predict(Mdl_kernel, testImages');

        trueLabels = testLabels';
        accuracy = sum(double(predicted_labels) - double(trueLabels) ==0)/10000;
        
        %write accuracy to matrix
        svm_rawDigit_Ns_linear(i) = accuracy
  
end

save svm_rawDigit_Ns_linear;


