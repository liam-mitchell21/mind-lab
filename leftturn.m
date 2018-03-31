function [] = rightturn(turnpower,turndist)
%params
rightwheel = MOTOR_B;

%driving objects
mTurnR = NXTMotor(rightwheel, 'Power', turnpower, 'TachoLimit', turndist);
mTurnR.SpeedRegulation = false; 

%% run
mTurnR.SendToNXT();
mTurnR.WaitFor();
end

