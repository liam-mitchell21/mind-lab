function [val] = light_sensor(port)
OpenLight(port, 'ACTIVE')
val = GetLight(port);
CloseSensor(port);
end

