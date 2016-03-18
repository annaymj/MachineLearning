% CS391L Machine Learning HW2
% Name: Anna Mengjie Yu
% Email: annayu2010@gmail.com
% UTEID: my3852
% Date: 2016/2/16

% This code loads and plots the original sound data

clear;
%load data
load sounds.mat;

% listen to the 5 different original sounds

% old man talking the law of thermodynamics
sound1 = sounds(1,:);
sound(sound1,11025);

% car sound
sound2 = sounds(2,:);
sound(sound2,11025);

% applause sound
sound3 = sounds(3,:);
sound(sound3,11025);

% man laughing
sound4 = sounds(4,:);
sound(sound4,11025);

% clapping hands
sound5 = sounds(5,:);
sound(sound5,11025);


% plot original sound 
subplot(5,1,1),plot(sound1,'r')
ylabel('sound1')
title('The Five Original Sound Sources','FontSize', 20)
subplot(5,1,2),plot(sound2,'m')
ylabel('sound2')
subplot(5,1,3),plot(sound3,'c')
ylabel('sound3')
subplot(5,1,4),plot(sound4,'b')
ylabel('sound4')
subplot(5,1,5),plot(sound5,'g')
ylabel('sound5')
savefig('FiveOriginalSounds.fig')
