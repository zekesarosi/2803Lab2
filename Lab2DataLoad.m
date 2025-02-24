clear;
clc;
close all;

%% Load in the Locomotive Data

folder_path = 'C:\Users\zekes\OneDrive\College\Year 3\ASEN 2803\2803LAB2\Locomotive_Data_2020\'; % Replace with your own folder path

list = dir([folder_path, '*Test*']); % This lists all files in fileLoc with 'Test" in the file name
numFiles = length(list);
testNum = zeros(numFiles, 1);
for i = 1:numFiles
    fileNames{i} = [folder_path, list(i).name]; % This makes a string of the complete file name with the path in front of it
    testNum(i) = str2num(char(extractBetween(list(i).name, '_', 'pt'))); % Finds the water volume in the name and make it a usable number
end
fileNames = char(fileNames); % Convert to char array from cell array
TestInfo = table(testNum, fileNames); % make a table 

hold on;
for i = 1:numFiles
    [theta_exp,w_exp,v_exp,time] = LCSDATA(fileNames(i,:));
    plot(time, theta_exp);
end
hold off;