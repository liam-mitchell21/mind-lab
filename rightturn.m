function [stalled] = rightturn(turnpower,turndist)
%params
stalled = 0;
leftwheel = MOTOR_C;

%driving objects
mTurnR = NXTMotor(leftwheel, 'Power', turnpower, 'TachoLimit', turndist);
mTurnR.SpeedRegulation = false; 

%% run
mTurnR.SendToNXT();
timedOut = WaitFor(mTurnR, 5);
    if timedOut
        mTurnR.Stop('off'); % this needed to "unlock" the motor
        stalled = 1;
    end
end

