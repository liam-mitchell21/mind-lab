%% closing shit prior to running
COM_CloseNXT('all')
close all
clear

%% connecting via usb
hNXT = COM_OpenNXTEx('USB', '', 'MotorControlFilename', 'MotorControl22.rxe');
COM_SetDefaultNXT(hNXT);
NXT_SendKeepAlive('dontreply');

%% defining params
drivepower = 60; %percent
turnpower = 40; %percent
drivedist = 720; %degrees
turndist = 220; %degrees
armpower = 50;
armdist = 90;

%% run
%{
forward(drivepower,drivedist);
rightturn(turnpower,turndist);
leftturn(turnpower,turndist);
reverse(drivepower,drivedist);

dist = ultrasonic(SENSOR_4);
light = light_sensor(SENSOR_1,'ACTIVE');
value = touch_sensor();
sound = sound_sensor(,'DB');

%}
%armup(armpower,armdist);
%armdown(armpower,armdist);

leftturn_2p(turnpower,turndist);


%% end
close all