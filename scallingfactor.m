% Extract roll, pitch, and yaw from the raw data
roll = raw_data(1:10000, 1);
pitch = raw_data(1:10000, 2);
yaw = raw_data(1:10000, 3);

% Compute expected gravity vector based on roll, pitch, and yaw angles
g_x = cos(pitch) .* sin(yaw);
g_y = -cos(pitch) .* cos(yaw) .* sin(roll) + sin(pitch) .* cos(roll);
g_z = cos(pitch) .* cos(yaw) .* cos(roll) + sin(pitch) .* sin(roll);
expected_gravity_vector = [g_x, g_y, g_z];

% Extract roll, pitch, and yaw from the raw data
roll1 = still_data(:, 1);
pitch1 = still_data(:, 2);
yaw1 = still_data(:, 3);

% Compute scaling factors for each axis
x_range = max(still_data(:, 4)) - min(still_data(:, 4));
y_range = max(still_data(:, 5)) - min(still_data(:, 5));

% Compute scaling factor for z axis using pitch and roll angles
x = still_data(:, 4);
y = still_data(:, 5);
z = y .* sin(pitch1) + x .* cos(pitch1) .* sin(roll1);
z_range = max(z) - min(z);
expected_range = [x_range, y_range, z_range];
scaling_factors = expected_range ./ norm(expected_gravity_vector);

%Compute calibration matrix
calibration_matrix = expected_gravity_vector .* scaling_factors;    

% Apply calibration to raw IMU data
calibrated_data = raw_data(1:10000, 4:5).* calibration_matrix(:, 1:2);

% Verify calibration by computing the mean and standard deviation of each axis
calibrated_mean = mean(calibrated_data);
calibrated_std = std(calibrated_data);

disp('Calibrated mean (X, Y,):');
disp(calibrated_mean);
disp('Calibrated standard deviation (X, Y,):');
disp(calibrated_std);