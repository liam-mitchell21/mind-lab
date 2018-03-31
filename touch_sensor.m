function [value] = touch_sensor(port)
OpenSwitch(port)
value = GetSwitch(port);
CloseSensor(port);
end

