function [theta_exp,w_exp,v_exp,time] = LCSDATA(filename)
    data = readmatrix(filename);

    time = data(:,1); %seconds
    wheelPos = data(:,2); %deg
    slidePos = data(:,3); %mm
    wheelSpeed = data(:,4); %deg/s
    slideSpeed = data(:,5); % mm/s
    sampleTime = data(:,6); %ms


    mins = islocalmin(wheelPos);
    second_min = find(mins,2);
    %% Data conditioning
    rotOffset = floorDiv(wheelPos, 360); % offset the rotation
    wheelPos = wheelPos - 360*rotOffset(1);
    
    % find the indexes for only the first 6 rotations 
    rot = 6;
    final_deg = (rot*360)+wheelPos(1);

    end_ind = find(wheelPos>final_deg, 1);

    % Condition the data to be sinusoidal 
    
    %rotOffset = floorDiv(wheelPos, 360); % offset the rotation
    %wheelPos = wheelPos - 360*rotOffset;

    
    %plot(time(1:end_ind), wheelPos(1:end_ind))

    theta_exp = wheelPos(1:end_ind);
    w_exp = wheelSpeed(1:end_ind);
    v_exp = slideSpeed(1:end_ind);
    time = time(1:end_ind);
end