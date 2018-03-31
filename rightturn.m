function [] = leftturn(turnpower,turndist)
%params
leftwheel = MOTOR_C;

%driving objects
mTurnR = NXTMotor(leftwheel, 'Power', turnpower, 'TachoLimit', turndist);
mTurnR.SpeedRegulation = false; 

%% run
mTurnR.SendToNXT();
mTurnR.WaitFor();
end

