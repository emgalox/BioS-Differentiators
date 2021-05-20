clc;
clear all; 
close all;
%% Frequency response analysis

%ideal differentiator
H = tf([1 0],[0 0 1])
bode(H,{0.0001,10000},'k')
hold on;

%BioSD differentiators
e=[0.0001 0.001 0.01 0.1]
for i=1:length(e)
H = tf([1 0],[e(i) e(i) 1])
bode(H,{0.0001,10000})
hold on;
end

legend('ε=0','ε=10^{-4}', 'ε=10^{-3}', 'ε=10^{-2}','ε=10^{-1}');
