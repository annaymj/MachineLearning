% CS391L Machine Learning HW1
% Name: Anna Mengjie Yu
% Email: annayu2010@gmail.com
% UTEID: my3852
% Date: 2016/1/31

% This code reads the experiment table generated in the experiments, and
% plots the 2D plot.

% load the k_imageNum_result.mat
load k_imageNum_result.mat

figure
plot(ImageNums,k_imageNum_result(1,:),'--bo')
hold on
%continue plot on the same figure
plot(ImageNums,k_imageNum_result(2,:))
plot(ImageNums,k_imageNum_result(3,:))
plot(ImageNums,k_imageNum_result(4,:))
plot(ImageNums,k_imageNum_result(5,:))
plot(ImageNums,k_imageNum_result(6,:),'-.g*')

title({'Comparison of Prediction Accuracy Using Different ks';'And Different Number of Training Images'})
xlabel('Number of training Images')
ylabel('Accuracy')
legend('k=1','k=5','k=10','k=20','k=40','k=100')
legend('Location','southeast')
hold off

%save figure
savefig('k_ImageNum.fig')

% load the k_imageNum_result.mat
load k_vectorNum_result.mat

figure
plot(vectorNums,k_vectorNum_result(1,:),'--bo')
hold on
%continue plot on the same figure
plot(vectorNums,k_vectorNum_result(2,:))
plot(vectorNums,k_vectorNum_result(3,:))
plot(vectorNums,k_vectorNum_result(4,:))
plot(vectorNums,k_vectorNum_result(5,:))
plot(vectorNums,k_vectorNum_result(6,:),'-.g*')

title({'Comparison of Prediction Accuracy Using Different ks';'And Different Number of top eigenvectors'})
xlabel('Number of top eigenvectors')
ylabel('Accuracy')
legend('k=1','k=5','k=10','k=20','k=40','k=100')
legend('Location','southeast')
hold off

savefig('k_vectorNum.fig')