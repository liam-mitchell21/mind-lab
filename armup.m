function [stalled] = armup(armpower, armdist)
%params
stalled = 0;
arm = MOTOR_A;

%driving objects
mArm = NXTMotor(arm, 'Power', -armpower, 'TachoLimit', armdist);

%% run
mArm.SendToNXT();
timedOut = WaitFor(mArm, 5);
    if timedOut
        mArm.Stop('off'); % this needed to "unlock" the motor
        stalled = 1;
    end
end

