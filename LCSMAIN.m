%% 2803 model plot
clc;
clear;
close all;


%% Load in the Locomotive Data
folder_path = 'C:\Users\zekes\OneDrive\College\Year 3\ASEN 2803\2803LAB2\Locomotive_Data_2020\'; % Replace with your own folder path

list = dir([folder_path, '*Test*']); % This lists all files in fileLoc with 'Test" in the file name
numFiles = length(list);
testNum = zeros(numFiles, 1);

for i = 1:numFiles
    fileNames{i} = [folder_path, list(i).name]; % This makes a string of the complete file name with the path in front of it
    testNum(i) = str2double(char(extractBetween(list(i).name, '_', 'pt'))); % Finds the water volume in the name and make it a usable number
    voltage = sprintf("%s.%s", [string(extractBetween(list(i).name, '_', 'pt')), string(extractBetween(list(i).name, 'pt', 'V'))]);
    voltages(i) =  voltage;
end
fileNames = char(fileNames); % Convert to char array from cell array
TestInfo = table(testNum, fileNames); % make a table 


% Input Parameters
revolutions = 6;
d = 155;
w = 3;
r = 75;
l = 260;


% Theta conversion and minimum position validation
theta = linspace(0,revolutions*2*pi);
theta_degs = rad2deg(theta);
theta_crit = 152.5;



%% Plot the test Data and model Data

for i = 1:numFiles
    figure(1);
    subplot(2,3,i);
    hold on;
    
    [theta_exp,w_exp,v_exp,time] = LCSDATA(fileNames(i,:));
    plot(theta_exp, v_exp, "LineWidth", 2, "Color", "k");
    
    w_test_mean = deg2rad(mean(w_exp));
    v_model = LCSMODEL(r, d, l, deg2rad(theta_exp), deg2rad(w_exp));
    plot(theta_exp, v_model, "LineWidth", 1, "Color", "red", "LineStyle","- -");

    xlim([0,2700]);
    ylim([-2700,2700]);
    label = sprintf("Motor Voltage: %sV", voltages(i));
    title(label);
    xlabel("Wheel Pos (deg)");
    ylabel("Slide Speed (mm/s)")
    hold off;

    % Plot Residuals
    figure(2);
    hold on;
    subplot(2,3,i);
    residual = v_model - v_exp;
    plot(theta_exp, residual, "LineWidth", 1, "Color", "red");
    ylim([-250,200]);
    xlim([0,2700]);
    label = sprintf("Motor Voltage: %sV", voltages(i));
    title(label);
    ylabel("Slide Speed (mm/s)");
    xlabel("Wheel Pos (degs)")
    hold off;


end
