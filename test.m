%closing shit prior to running
COM_CloseNXT('all')
close all
clear

%connecting via usb
hNXT = COM_OpenNXTEx('USB', '', 'MotorControlFilename', 'MotorControl22.rxe');
COM_SetDefaultNXT(hNXT);
NXT_SendKeepAlive('dontreply');

%% defining motors

%params
leftwheel = MOTOR_C;
rightwheel = MOTOR_B;
bothwheel = [rightwheel;leftwheel];
arm = MOTOR_A;

drivepower = 60;
turnpower = 40;
drivedist = 1000; %degrees
turndist = 220; %degrees

%driving objects
mFor = NXTMotor(bothwheel, 'Power', drivepower, 'TachoLimit', drivedist);
mRev = mFor;
mRev.Power = -mFor.Power; 

%% run

mFor.SendToNXT();
mFor.WaitFor();

mRev.SendToNXT();
mRev.WaitFor();

