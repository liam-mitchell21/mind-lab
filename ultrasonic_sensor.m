function [dist] = ultrasonic_sensor(port)
OpenUltrasonic(port)
USMakeSnapshot(port);
pause(0.1);
dist = USGetSnapshotResults(port);
CloseSensor(port);
end

