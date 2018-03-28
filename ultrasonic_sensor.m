function [dist] = ultrasonic_sensor(port)
OpenUltrasonic(port)
dist = GetUltrasonic(port);
CloseSensor(port);
end

