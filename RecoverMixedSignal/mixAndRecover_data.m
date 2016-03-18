% CS391L Machine Learning HW2
% Name: Anna Mengjie Yu
% Email: annayu2010@gmail.com
% UTEID: my3852
% Date: 2016/2/16

% This code implements the ICA algorithm to recover the mixed signal
% load sound
load_sound

[num_source,length] = size(sounds);

% select 3 source signals to mix
% original source matrix U
U = sounds([1,3,4],:);

% plot the selected original sound
% subplot(3,1,1),plot(U(1,:),'r')
% ylabel('Original sound1')
% title('The Three original Sound Sources','FontSize', 20)
% subplot(3,1,2),plot(U(2,:),'c')
% ylabel('Original sound3')
% subplot(3,1,3),plot(U(3,:),'b')
% ylabel('Original sound4')
% savefig('Originalsounds.fig')

% create weight matrix A  ( m by n) to mix signals
A = rand(3);

% implement ICA algorithm
[W,X] = ICA(A,U);

% plot mixed sounds
% subplot(3,1,1),plot(X(1,:),'r')
% ylabel('Mixed sound1')
% title('The Three Mixed Sound Sources','FontSize', 20)
% subplot(3,1,2),plot(X(2,:),'c')
% ylabel('Mixed sound3')
% subplot(3,1,3),plot(X(3,:),'b')
% ylabel('Mixed sound4')
% savefig('Mixedsounds.fig')



% recovered data
recovered = W * X;
% recovered_1 = recovered(1,:);
% recovered_2 = recovered(2,:);
% recovered_3 = recovered(3,:);

% plot recovered sound
% subplot(3,1,1),plot(recovered_1,'r')
% ylabel('recovered sound1')
% title('The Three Recovered Sound Sources','FontSize', 20)
% subplot(3,1,2),plot(recovered_2,'c')
% ylabel('recovered sound3')
% subplot(3,1,3),plot(recovered_3,'b')
% ylabel('recovered sound4')
% savefig('Recoveredsounds.fig')

% quantify the result by calculating correlation coefficient
corrcoef([U' recovered'])