clc;
clear all; 
close all;
%% Frequency response analysis - Low pass filter

m=[0.1 1 10 50];
for i=1:length(m)
H = tf([m(i)],[1 m(i)]);
bode(H,{0.0001,10000});
hold on;
end

l = legend('μ=0.5','μ=1','μ=10','μ=50','FontName', 'Arial');
