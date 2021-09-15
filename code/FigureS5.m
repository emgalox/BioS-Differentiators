clc;
clear all; 
close all;
%% Frequency response analysis - BioSDF differentiators

%ideal differentiator
Hi = tf([1 0],[0 0 1]);
bode(Hi,{0.0001,10000},'--k');
hold on;

%BioSD differentiator
H = tf([1 0],[0.1 0.1 1]);
bode(H,{0.0001,10000},'--b');
hold on;

%BioSDF differentiators
m=[0.1 1 10 50];
for i=1:length(m)
H1 = tf([m(i)],[1 m(i)]);
sys1=H1*H;
bode(sys1,{0.0001,10000});
hold on;
end

legend('Ideal differentiation', 'BioSD','BioSD^{F}, μ=0.5','BioSD^{F}, μ=1','BioSD^{F}, μ=10','BioSD^{F}, μ=50','FontName', 'Arial','Location','southwest')
