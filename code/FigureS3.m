clc;
clear all; 
close all;
%% Frequency response analysis - BioSD differentiators

%ideal differentiator
H = tf([1 0],[0 0 1]);
bode(H,{0.0001,10000},'--k');
hold on;

%BioSD differentiators
e=[0.01 0.1 1 10 100];
for i=1:length(e)
H = tf([1 0],[e(i) e(i) 1]);
bode(H,{0.0001,10000});
hold on;
end

legend('Ideal differentiation','ε=0.01', 'ε=0.1','ε=1','ε=10','ε=100');

