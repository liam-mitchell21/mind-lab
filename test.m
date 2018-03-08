%closing shit prior to running
COM_CloseNXT('all')
close all
clear all

%connecting via usb
hNXT = COM_OpenNXTEx('USB', '', 'MotorControlFilename', '');

%main program
NXT_PlayTone(600,500, hNXT);
