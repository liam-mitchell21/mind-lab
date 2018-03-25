function [dist] = ultrasonic(port)
OpenUltrasonic(port)
dist = GetUltrasonic(port);
CloseSensor(port);
end

