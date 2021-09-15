clc;
clear all; 
close all;
%% A performance metric in the frequency domain for BioSDF differentiators

%ideal case
H = tf([1],[0 0 1]);
bode(H,{0.0001,10000},'--k');
hold on;

%realistic case without extra filtering
H = tf([1],[0.1 0.1 1]);
bode(H,{0.0001,10000},'--b');
hold on;

%realistic cases with extra filtering
m=[0.1 1 10 50];
for i=1:length(m)
H1 = tf([m(i)],[1 m(i)]);
sys1=H1*H;
bode(sys1,{0.0001,10000});
hold on;
end


legend('Ideal differentiation', 'without extra filtering','μ=0.5', 'μ=1','μ=10', 'μ=50','FontName', 'Arial','Location','southwest');
