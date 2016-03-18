% CS391L Machine Learning HW2
% Name: Anna Mengjie Yu
% Email: annayu2010@gmail.com
% UTEID: my3852
% Date: 2016/2/16

% implement ICA algorithm

function [W,X] = ICA(A,U)

% set parameters
num_iter = 100000;
epsilon = 1e-6;
eta = 0.1;

[m,n] = size(A);
I = eye(n);

% step 1: Generate the mixed signal matrix X
X = A * U;

% step 2: Initialize W ( n by m) with small random values
W = rand(n,m)/10;



% step 3: Calculate Y = WX
% repeat step 3-6 this step for num_iter times
for i=1:num_iter
    
    Y = W * X;
    
    % step 4: Calculate Z
    Z = 1./(1.+ exp(-Y)) ;
    
    % step 5: find delta_W, with eta as a small learning rate
    
    delta_W = eta*(I + (1-2*Z) *Y') * W;
    
    % step 6: update W = W + delta_W
    updated_W = W + delta_W;
    
    % check stopping condition
    if norm(W - updated_W) < epsilon
        % update W and stop
        W = updated_W;
        break;
    end
    
    % otherwise, end with the largest number of iterations
    W = updated_W;
end