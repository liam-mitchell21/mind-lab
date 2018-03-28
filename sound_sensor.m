function [val] = sound_sensor(port)
OpenSound(port, 'DB')
val = GetSound(port);
CloseSensor(port);
end

