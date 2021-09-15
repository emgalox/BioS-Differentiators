clc;
clear all; 
close all;
%%
[t,y]=response;

%zero-level
Axis=(100 + t*0);

%ideal derivative appropriately shifted
dt1=diff(t);
df1=diff(y(:,11)+100*t);
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
xlabel('Time','FontName', 'Arial','FontSize',20) 
ylabel('Concentration','FontName', 'Arial','FontSize',20) 
legend(' Derivative of the Input signal dU/dt','Output signal X', 'Zero-level', 'Location','north','FontName', 'Arial','FontSize',18)

%BioSD response 
%%
function [t,y]=response()
tspace=linspace(0,100,1000);

[t,y]=ode23s(@sol,tspace,[2.0928;100; 1.5928;100;2.0928; 1.5928;0;0;0;0;0]);


function dydt=sol(t,y)
dydt(1,1)=1*y(2)- 30*y(1)*y(3);                                 
dydt(2,1)=-1*y(2)*y(1)+ 1*y(4)*y(6) + 100 +(y(11))*100 - 0.5*y(2);
dydt(3,1)=100-30*y(1)*y(3);
dydt(4,1)=-1*y(4)*y(1)+ 1*y(4)*y(6) +100 + (y(11))*100 - 0.5*y(4); 
dydt(5,1)=1*y(2)-30*y(5)*y(6);
dydt(6,1)=100-30*y(5)*y(6);
dydt(7,1)=2*y(9)- y(7);
dydt(8,1)=4*y(7)- y(8);
dydt(9,1)=2-12*y(9)*y(10);
dydt(10,1)=2*y(8)-12*y(9)*y(10);
dydt(11,1)=4*y(7)- y(11);

end
end