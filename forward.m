function [] = forward(drivepower,drivedist)
%params
leftwheel = MOTOR_C;
rightwheel = MOTOR_B;
bothwheel = [rightwheel;leftwheel];

%driving objects
mFor = NXTMotor(bothwheel, 'Power', drivepower, 'TachoLimit', drivedist);

%% run
mFor.SendToNXT();
mFor.WaitFor();
end

