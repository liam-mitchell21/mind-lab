function [stalled] = leftturn(turnpower,turndist)
%params
stalled = 0;
rightwheel = MOTOR_B;

%driving objects
mTurnL = NXTMotor(rightwheel, 'Power', turnpower, 'TachoLimit', turndist);
mTurnL.SpeedRegulation = false; 

%% run
mTurnL.SendToNXT();
timedOut = WaitFor(mTurnL, 5);
    if timedOut
        mTurnL.Stop('off'); % this needed to "unlock" the motor
        stalled = 1;
    end
end

