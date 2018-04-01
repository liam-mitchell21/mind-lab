function [stalled] = reverse(drivepower,drivedist)
%params
stalled = 0; 
leftwheel = MOTOR_C;
rightwheel = MOTOR_B;
bothwheel = [rightwheel;leftwheel];

%driving objects
mRev = NXTMotor(bothwheel, 'Power', -(drivepower), 'TachoLimit', drivedist);

%% run
mRev.SendToNXT();
timedOut = WaitFor(mRev, 5);
    if timedOut
        mRev.Stop('off'); % this needed to "unlock" the motor
        stalled = 1;
    end
end

