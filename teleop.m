%% closing shit prior to running
COM_CloseNXT('all')
close all
clear

warning('off','all');

%% connecting via usb
hNXT = COM_OpenNXTEx('Any', '00:16:53:05:66:61', 'bluetooth.ini', 'MotorControlFilename', 'MotorControl22.rxe');
COM_SetDefaultNXT(hNXT);
NXT_SendKeepAlive('dontreply');

%% defining params
drivepower = 90; %percent
turnpower = 70; %percent
drivedist = 720; %degrees
turndist = 220; %degrees

%% run
%
a=1;
while a == 1
    key = input('type, monkey ', 's');
    if key == 'q'
        drivedist = floor(drivedist*1.2);
        disp(['drivedist is ' num2str(drivedist)]);
    elseif key == 'e'
        drivedist = floor(drivedist/1.2); 
        disp(['drivedist is' num2str(drivedist)]);
    elseif key == 'w'
        forward(drivepower, drivedist);
    elseif key == 's'
        reverse(drivepower, drivedist);
    elseif key == 'a' 
        leftturn(turnpower, turndist);
    elseif key == 'd' 
        rightturn(turnpower,turndist);
    elseif key == 'z' 
        turndist = floor(turndist*1.2);
        disp(['turndist is' num2str(turndist)]);
    elseif key == 'x'
        turndist = floor(turndist/1.2); 
        disp(['turndist is' num2str(turndist)]);
    end
    if key == 'k'
        break
    end
end
%}

%% end
close all