%% 2803 model plot
clc;
clear;
close all;

% Input Parameters
revolutions = 6;
d = 15.5;
w = 3;
r = 7.5;
l = 26;

% Theta conversion and minimum position validation
theta = linspace(0,revolutions*2*pi);
theta_crit = 152.5*pi/180;

figure(1)
hold on
grid on
title('Velocity of the Collar for 6 Revolutions')
%plot(theta, pos,"Color",'red',"LineWidth",2,"LineStyle","-")
plot(theta, LCSMODEL(r,d,l,theta,w),"Color",'green',"LineWidth",2,"LineStyle","-.")
xline(theta_crit,"Color",'black')
legend('Velocity (cm/s)','Minimum Collar Position')
xlabel('Theta (rad)')
ylabel('Velocity (cm/s)')
ylim([-30,40])
hold off

%function LCSMODEL(r,d,l,theta,w)

%end