clc;
clear all; 
close all;
%%
[t,y]=response;

%zero-level
Axis=(19.9649+ t*0);

%ideal derivative appropriately shifted
dt1=diff(t);
df1=diff(y(:,7)+ 19.9649*t);
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

[t,y]=ode23s(@sol,tspace,[1.1722;19.9649;0;0;0;0;0;2.3984]);


function dydt=sol(t,y)
dydt(1,1)=900*y(2)/(880+y(2))-7.09*y(1)*y(8)-0.028*y(1);                                  
dydt(2,1)=-1.6*y(2)*y(1) + 40 + (y(7))*1.6*20 - (0.1+0.028)*y(2);       
dydt(3,1)=2*y(5)- y(3);
dydt(4,1)=4*y(3)- y(4);
dydt(5,1)=2-12*y(5)*y(6);
dydt(6,1)=2*y(4)-12*y(5)*y(6);
dydt(7,1)=4*y(3)- y(7);
dydt(8,1)=20-7.09*y(1)*y(8)-0.028*y(8);
end
end