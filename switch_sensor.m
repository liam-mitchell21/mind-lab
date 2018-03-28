function [val] = switch_sensor(port)
OpenSwitch(port)
val = GetSwitch(port);
CloseSensor(port);
end

