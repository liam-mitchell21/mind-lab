%% closing shit prior to running
COM_CloseNXT('all')
close all
clear

warning('off','all');

%% connecting
hNXT = COM_OpenNXTEx('Any', '00:16:53:05:66:61', 'bluetooth.ini', 'MotorControlFilename', 'MotorControl22.rxe');
COM_SetDefaultNXT(hNXT);
NXT_SendKeepAlive('dontreply');

%% defining params
drivepower = 90; %percent
turnpower = 70; %percent
armpower = 60; %percent
drivedist = 360; %degrees
turndist = 220; %degrees
armdist = 185; %degrees
stall = 0;

%% run loop
for a = 1:20
    distance = ultrasonic_sensor(SENSOR_4); 
    maxdist = max(distance(:));
    disp(['object detected at ' num2str(maxdist) ' cm']); 
    bumperstate = touch_sensor(SENSOR_1);

    if bumperstate == 1 | stall == 1 | maxdist <= 30 
        state = 'Object found! Avoiding object';
        disp(state);
        stall_1 = reverse(drivepower, drivedist);
        stall_2 = leftturn(turnpower, turndist);
        if stall_1 == 1 | stall_2 == 1
            state = 'Attempting to escape';
            disp(state);
            forward(drivepower, drivedist);
        else 
            stall = 0;
        end
    elseif bumperstate == 0 | maxdist >= 30
        state = 'Exploring';
        disp(state);
        stall = forward(drivepower, drivedist);
    end
end
%% end

close all