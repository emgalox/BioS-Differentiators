clc;
clear all; 
close all;
%% Frequency response analysis - Low pass filter

e=[1 10 40 100]
for i=1:length(e)
H = tf([e(i)],[1 e(i)])
bode(H,{0.0001,10000})
hold on;
end

l = legend('μ=1','μ=10','μ=40','μ=100','FontName', 'Arial');