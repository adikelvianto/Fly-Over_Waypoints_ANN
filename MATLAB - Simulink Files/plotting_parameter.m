% Load Data
load('FlightDataRecorder.mat', 'FlightData')
load('yaw_error.mat', 'yaw_error')
load('jsroll_sim_pid.mat', 'jsroll_sim_pid')
load('RL_stat.mat', 'RL_stat')
load('kd.mat', 'kd')
load('kp.mat', 'kp')
load('error_rate.mat', 'error_rate')

% Extract variables
yaw_error = yaw_error(2,:)';
jsroll_sim = jsroll_sim_pid(2,:)';
RL_stat = RL_stat(2,:)';
KD = kd(2,:)';
KP = kp(2,:)';
error_rate = error_rate(2,:)';
table = FlightData';

combined_data = [table,yaw_error,jsroll_sim,RL_stat,KP,KD,error_rate];

X = table(:,5);
Y = table(:,6);
waypoint_x = table(:,26);
waypoint_y = table(:,27);
phi = table(:,10); 

figure()
plot(jsroll_sim)
legend('JSRoll Sim');
title('JS Roll Simulink')

figure()
plot(phi)
title('Roll Angle')

figure()
plot(waypoint_x,waypoint_y)
hold on
plot(X,Y)
title('Waypoint vs longitude latitude');

figure()
plot(yaw_error)
title('yaw error')

figure()
plot(RL_stat)
title('Roll Limiter Status')
%%
% Save csv file to a specific folder
folder = 'D:\Documents\Akademik ITB\TA Waypoint Following\CSV PID FINAL';
numberSuffix = 2;
baseFileName = 'Cirrus1';
fullFileName = fullfile(folder, append(baseFileName, '.csv'));

while numberSuffix < 500 % Exit at 500 as a failsafe, just in case all files exist.
  if exist(fullFileName, 'file')
    % Construct a new filename.
    baseFileName = sprintf('Cirrus%d.csv', numberSuffix);
    fullFileName = fullfile(folder, baseFileName);
    % Prepare for next time, in case this name also existed.
    numberSuffix  = numberSuffix  + 1;
  else
    break; 
  end
end

csvwrite(fullFileName,combined_data)