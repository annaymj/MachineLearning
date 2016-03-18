% CS391L Machine Learning HW1
% Name: Anna Mengjie Yu
% Email: annayu2010@gmail.com
% UTEID: my3852
% Date: 2016/1/31

% This function takes a x by k matrixA, 
% outputs an x by 1 mean column vector
% and a x by k matrix of eigenvectors sorted by eigenvalues in descending
% order

function [vectorM,matrixV] = hw1FindEigendigits(matrixA)

% matrixA is x by k
[x,k] = size(matrixA);

% mean column vector of A with dimension 2
vectorM = mean(matrixA,2);

% subtract the column mean from matrixA; mean normalization
matrixA = double(matrixA) - repmat(vectorM,1,k);

% if k < x
if k < x
    % make covariance matrix k*k
    % matrixV contains the eigenvectors
    % matrixD is a diagonal contains the corresponding eigenvalues
    [matrixV,matrixD] = eig(matrixA' * matrixA);
    
    %sort the eigenvalues in descending order
    [matrixD_sorted,Index] = sort(diag(matrixD),'descend');
    
    %update the eigenvector columns accordingly
    matrixV = matrixV(:,Index);
    
    %multiply the eigenvector matrix by matrix A
    %matrixV is k by k, matrixA is x by k,resulting matrixV x by k
    matrixV = matrixA * matrixV;
    
    %normalize the vector
    matrixV = normc(matrixV);
   
% if k >= x    
else
    [matrixV, matrixD] = eig(matrixA * matrixA');
    
    %sort the eigenvectors in descending order, get index
    [matrixD_sorted,Index] = sort(diag(matrixD),'descend');
    matrixV = matrixV(:,Index);
    
    %normalize the vector
    matrixV = normc(matrixV);
end


    

