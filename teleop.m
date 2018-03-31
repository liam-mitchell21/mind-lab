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
drivedist = 360; %degrees
turndist = 220; %degrees

%% run
%
a=1;
while a == 1
    key = input('type, monkey ', 's');
    if key == 'q'
        drivedist = drivedist*1.2;
        disp(['drivedist is ' num2str(drivedist)]);
    elseif key == 'e'
        drivedist = drivedist/1.2; 
        disp(['drivedist is ' num2str(drivedist)]);
    elseif key == 'w'
        forward(drivepower, floor(drivedist));
    elseif key == 's'
        reverse(drivepower, floor(drivedist));
    elseif key == 'a' 
        leftturn(turnpower, floor(turndist));
    elseif key == 'd' 
        rightturn(turnpower,floor(turndist));
    elseif key == 'z' 
        turndist = turndist*1.2;
        disp(['turndist is ' num2str(turndist)]);
    elseif key == 'x'
        turndist = turndist/1.2; 
        disp(['turndist is ' num2str(turndist)]);
    end
    if key == 'k'
        break
    end
end
%}

%% end
close all