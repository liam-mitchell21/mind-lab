function [stalled] = forward(drivepower,drivedist)
%params
stalled = 0;
leftwheel = MOTOR_C;
rightwheel = MOTOR_B;
bothwheel = [rightwheel;leftwheel];

%driving objects
mFor = NXTMotor(bothwheel, 'Power', drivepower, 'TachoLimit', drivedist);

%% run
mFor.SendToNXT();
timedOut = WaitFor(mFor, 5);
    if timedOut
        mFor.Stop('off'); % this needed to "unlock" the motor
        stalled = 1;
    end
end

