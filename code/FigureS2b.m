clc;
clear all; 
close all;
%%
[t,y]=response;

%zero-level
Axis=(10 + t*0);

%ideal derivative appropriately shifted
dt1=diff(t);
df1=diff(y(:,3)+10*t);
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
ay.YLim = [10 10.3];
ay.YTick = [10 10.1 10.3];
xlabel('Time','FontName', 'Arial','FontSize',20) 
ylabel('Concentration','FontName', 'Arial','FontSize',20) 
legend(' Derivative of the Input signal dU/dt','Output signal X', 'Zero-level', 'Location','north','FontName', 'Arial','FontSize',18)

%BioSD response 
%%
function [t,y]=response()
tspace=linspace(0,40,1000);

[t,y]=ode23s(@sol,tspace,[9.5350;10;0;0.0350;]);


function dydt=sol(t,y)
dydt(1,1)=1*y(2)- 30*y(1)*y(4);                                  
dydt(2,1)=-1*y(2)*y(1)+1*y(2)*y(4) +100 + (y(3))*10 - 0.5*y(2);       
dydt(3,1)=0.1 - 0.0001*y(3);%x1
dydt(4,1)=10- 30*y(1)*y(4);
end
end