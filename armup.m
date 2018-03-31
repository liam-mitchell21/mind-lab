function [] = armup(armpower, armdist)
%params
arm = MOTOR_A;

%driving objects
mRev = NXTMotor(arm, 'Power', -armpower, 'TachoLimit', armdist);

%% run
mRev.SendToNXT();
mRev.WaitFor();
end

