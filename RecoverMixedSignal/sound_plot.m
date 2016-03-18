% CS391L Machine Learning HW2
% Name: Anna Mengjie Yu
% Email: annayu2010@gmail.com
% UTEID: my3852
% Date: 2016/2/16

% plot the recovered, mixed and original sound data

mixAndRecover_data

% Original sound matrix is U
% Mixed sound matrix is X



% Recovered sound matrix is recovered
recovered_1 = recovered(1,:);
recovered_2 = recovered(2,:);
recovered_3 = recovered(3,:);


% plot in the order of recovered, mixed, original
% plot recovered
subplot(9,1,1),plot(recovered_1,'r')
ylabel('Recovered sound1')
title('The Three Recovered Sound Sources (eta = 0.001)','FontSize', 18)
subplot(9,1,2),plot(recovered_2,'c')
ylabel('Recovered sound3')
subplot(9,1,3),plot(recovered_3,'b')
ylabel('Recovered sound4')

% plot mixed sounds
subplot(9,1,4),plot(X(1,:),'r')
ylabel('Mixed sound1')
title('The Three Mixed Sound Sources','FontSize', 18)
subplot(9,1,5),plot(X(2,:),'c')
ylabel('Mixed sound3')
subplot(9,1,6),plot(X(3,:),'b')
ylabel('Mixed sound4')

% plot the original sounds
subplot(9,1,7),plot(U(1,:),'r')
ylabel('Original sound1')
title('The Three Original Sound Sources','FontSize', 18)
subplot(9,1,8),plot(U(2,:),'c')
ylabel('Original sound3')
subplot(9,1,9),plot(U(3,:),'b')
ylabel('Original sound4')
%savefig('Experiment1_10000_0.01.fig')
%savefig('Experiment1_100000_0.01.fig')


