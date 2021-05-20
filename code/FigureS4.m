clc;
clear all; 
close all;
%% Frequency response analysis

%ideal differentiator
Hi = tf([1 0],[0 0 1])
bode(Hi,{0.0001,10000},'--k')
hold on;

%BioSD differentiator
H = tf([1 0],[0.0001 0.0001 1])
bode(H,{0.0001,10000},'--b')
hold on;

%BioSDF differentiators
m=[1 10 40 100]
for i=1:length(m)
H1 = tf([m(i)],[1 m(i)])
sys1=H1*H
bode(sys1,{0.0001,10000})
hold on;
end

l = legend('Ideal', 'BioSD','BioSD^{F}, μ=1','BioSD^{F}, μ=10','BioSD^{F}, μ=40','BioSD^{F}, μ=100','FontName', 'Arial','Location','southwest')

