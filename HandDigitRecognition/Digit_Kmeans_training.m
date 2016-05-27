
%get top 2 PC component for KMeans clustering 
ImageNums = [400];
i=1;
ImageNum = ImageNums(i);
sub_trainImages = double(trainImages(:,1:ImageNum));
trainLabels = double(trainLabels);

%subset_trainLabels = double(trainLabels(:,1:ImageNum));
[m,matrixV] = hw1FindEigendigits(sub_trainImages);
    
 %only only top 2 PCs
 X = matrixV(:,1:2);
    
 % Cluster the data. Specify k = 3 clusters.
rng(1); % For reproducibility
[idx,C] = kmeans(X,10);

% Use kmeans to compute the distance from each centroid to points on a grid. 
% To do this, pass the centroids (C) and points on a grid to kmeans, 
% and implement one iteration of the algorithm.

x1 = min(X(:,1)):0.0001:max(X(:,1));
x2 = min(X(:,2)):0.0001:max(X(:,2));
[x1G,x2G] = meshgrid(x1,x2);
XGrid = [x1G(:),x2G(:)]; % Defines a fine grid on the plot

idx2Region = kmeans(XGrid,10,'MaxIter',50,'Start',C);
% Assigns each node in the grid to the closest centroid

% Plot the cluster regions.
figure;
color = [1,0,1; 1,1,0; 0,1,1; 1,0,0; 0,1,0; 0,0,1; 1,1,1 ;0.5,0,0.5; 0,0.5,0.5; 0.5,0.5,0];
gscatter(XGrid(:,1),XGrid(:,2),idx2Region,color,'..........');
hold on;
plot(X(:,1),X(:,2),'k*','MarkerSize',5);
title 'Kmeans clustering of training digits (N=400, Iter=50)';
xlabel 'PC1';
ylabel 'PC2';
legend('hide');
hold off;