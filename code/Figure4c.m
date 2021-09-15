clc;
clear all; 
close all;
%%
[t,y]=response;

figure
hold on
p1=plot(t,y(:,1),'r');
hold off
p1.LineWidth = 2;
ay = gca;
ay.YLim = [0 4];
ay.YTick = [0 1 2 3 4];
xlabel('Time','FontName', 'Arial','FontSize',20) 
ylabel('Concentration','FontName', 'Arial','FontSize',20) 
legend('Input signal U','Location','north','FontName', 'Arial','FontSize',18)

%input signal
%%
function [t,y]=response()
tspace=linspace(0,40,1000);

[t,y]=ode23s(@sol,tspace,[0;]);


function dydt=sol(t,y)      
dydt(1,1)=0.1 - 0.0001*y(1);

end
end