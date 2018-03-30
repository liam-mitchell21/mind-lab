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
drivepower = 60; %percent
turnpower = 40; %percent
drivedist = 720; %degrees
turndist = 220; %degrees

%% run
%
forward(drivepower,drivedist);
rightturn(turnpower,turndist);
leftturn(turnpower,turndist);
reverse(drivepower,drivedist);
%}

%% end
close all