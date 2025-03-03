%% Load in the Locomotive Data
folder_path = 'C:\Users\zekes\OneDrive\College\Year 3\ASEN 2803\2803LAB2\Locomotive_Data_2020\'; % Replace with your own folder path

list = dir([folder_path, '*Test*']); % This lists all files in fileLoc with 'Test" in the file name
numFiles = length(list);
testNum = zeros(numFiles, 1);

for i = 1:numFiles
    
    fileNames{i} = [folder_path, list(i).name]; % This makes a string of the complete file name with the path in front of it
    testNum(i) = str2double(char(extractBetween(list(i).name, '_', 'pt'))); % Finds the water volume in the name and make it a usable number
end
fileNames = char(fileNames); % Convert to char array from cell array
TestInfo = table(testNum, fileNames); % make a table 


%% Plot the test Data
hold on;
for i = 1:numFiles
    subplot(2,3,i)
    [theta_exp,w_exp,v_exp,time] = LCSDATA(fileNames(i,:));
    plot(theta_exp, v_exp, "LineWidth", 1.5);
    xlim([0,2700]);
    ylim([-1700,2200]);
    label = sprintf("Test Num: %d", i);
    title(label);
    xlabel("Wheel Pos (deg)");
    ylabel("Slide Speed mm/s")
end
hold off;