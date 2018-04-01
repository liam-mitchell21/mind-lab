function [stalled] = armdown(armpower, armdist)
%params
arm = MOTOR_A;
stalled = 0;

%driving objects
mArm = NXTMotor(arm, 'Power', armpower, 'TachoLimit', armdist);

%% run
mArm.SendToNXT();
timedOut = WaitFor(mArm, 5);
    if timedOut
        mArm.Stop('off'); % this needed to "unlock" the motor
        stalled = 1; 
    end
end

