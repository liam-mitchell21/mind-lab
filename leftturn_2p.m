function [] = rightturn_2p(turnpower,turndist)
%params
leftwheel = MOTOR_C;
rightwheel = MOTOR_B;

%driving objects
mTurnR1 = NXTMotor(leftwheel, 'Power', -turnpower, 'TachoLimit', turndist);
mTurnR1.SpeedRegulation = false; 
mTurnR2 = mTurnR1;
mTurnR2.Port = rightwheel;
mTurnR2.Power = -mTurnR1.Power;

%% run
mTurnR1.SendToNXT();
mTurnR1.WaitFor();
mTurnR2.SendToNXT();
mTurnR2.WaitFor();
end

