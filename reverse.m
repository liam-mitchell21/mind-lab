function [] = reverse(drivepower,drivedist)
%params
leftwheel = MOTOR_C;
rightwheel = MOTOR_B;
bothwheel = [rightwheel;leftwheel];

%driving objects
mRev = NXTMotor(bothwheel, 'Power', -(drivepower), 'TachoLimit', drivedist);

%% run
mRev.SendToNXT();
mRev.WaitFor();
end

