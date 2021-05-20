clc;
clear all; 
close all;
%%
[t,y]=response;

%zero-level
Axis=(100 + t*0);

%ideal derivative appropriately shifted
dt1=diff(t);
df1=diff(1+sin(t)+100*t);
derivative = df1./dt1;

figure
hold on
p1=plot(t(1:end-1),derivative,'color','[1 0.75 0]');
p2=plot(t,y(:,2),'b');
p3=plot(t,Axis,'k:');
hold off
p1.LineWidth = 2;
p2.LineWidth = 2;
p3.LineWidth = 2;
ay = gca;
ay.YLim = [98 103];
ay.YTick = [98 99 100 101 102 103];
xlabel('Time','FontName', 'Arial','FontSize',20) 
ylabel('Concentration','FontName', 'Arial','FontSize',20) 
legend(' Derivative of the Input signal dU/dt','Output signal X', 'Zero-level', 'Location','north','FontName', 'Arial','FontSize',18)

%BioSD response 
%%
function [t,y]=response()
tspace=linspace(0,50,1000);

[t,y]=ode23s(@sol,tspace,[1.7;100;]);


function dydt=sol(t,y)
dydt(1,1)=1*y(2)- 100;                                  
dydt(2,1)=-1*y(2)*y(1) + 100 + (1.2+sin(t)+0.2*sin(50*t))*100 - 0.5*y(2);       


end
end