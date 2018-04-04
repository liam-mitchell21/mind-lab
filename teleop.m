%% closing shit prior to running
COM_CloseNXT('all')
close all
clear

warning('off','all');

%% connecting
hNXT = COM_OpenNXTEx('Bluetooth', '00:16:53:05:66:61', 'bluetooth.ini', 'MotorControlFilename', 'MotorControl22.rxe');
COM_SetDefaultNXT(hNXT);
NXT_SendKeepAlive('dontreply');

%% defining params
drivepower = 90; %percent
turnpower = 70; %percent
armpower = 60; %percent
drivedist = 360; %degrees
turndist = 220; %degrees
armdist = 185; %degrees

%% run
%
% w a s d = 4 directional drive
% q e     = linear dist up/down
% z x     = turn dist up/down
% r       = toggle arm up/down
% i o     = get values from light/ultrasonic sensors
% k CTRL+c      = end 
a=1;
armstate = 0; %setting state for arm toggle, 0 is up

while a == 1
    bumperstate = touch_sensor(SENSOR_1); %checking bumper before first input
    if bumperstate == 1
        disp('bumper is pushed!');
    end
    key = input('type, monkey: ', 's'); %getting user input
    if key == 'q' %linear speed up
        drivedist = drivedist*1.2;
        disp(['drivedist is ' num2str(drivedist)]);
    elseif key == 'e' %linear speed down
        drivedist = drivedist/1.2; 
        disp(['drivedist is ' num2str(drivedist)]);
    elseif key == 'w' 
        forward(drivepower, floor(drivedist));
    elseif key == 's'
        reverse(drivepower, floor(drivedist));
    elseif key == 'a' 
        leftturn(turnpower, floor(turndist));
    elseif key == 'd' 
        rightturn(turnpower,floor(turndist));
    elseif key == 'z' %turnspeed up
        turndist = turndist*1.2;
        disp(['turndist is ' num2str(turndist)]);
    elseif key == 'x' %turnspeed down
        turndist = turndist/1.2; 
        disp(['turndist is ' num2str(turndist)]);
    elseif key == 'r' %toggle arm
        if armstate == 0
            armdown(armpower, armdist);
            armstate = 1;
        elseif armstate == 1
            armup(armpower, armdist);
            armstate = 0;
        end
    elseif key == 'i' %get light sensor value
        lightvalue = light_sensor(SENSOR_3);
        disp(['current light value is ' num2str(lightvalue)]);
    elseif key == 'o' %get ultrasonic distance (might not work?)
        distance = ultrasonic_sensor(SENSOR_4);
        maxdist = max(distance(:));
        disp(['current distance to a solid surface is ' num2str(maxdist) ' cm']);
    end
    if key == 'k' %end it all
        break
    end
    if armstate == 1 %setting arm up if it isnt
        armup(armpower, armdist);
    end
end
%}

%% end
close all