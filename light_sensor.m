function [val] = light_sensor(port)
OpenLight(port, 'ACTIVE')
val = Getlight(port);
CloseSensor(port);
end

