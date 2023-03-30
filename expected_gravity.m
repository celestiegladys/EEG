

% Extract roll, pitch, and yaw from the raw data
roll = data2(:, 1);
pitch = data2(:, 2);
yaw = data2(:, 3);

% Compute expected gravity vector based on roll, pitch, and yaw angles

g_x = cos(pitch) .* sin(yaw);
g_y = sin(pitch) .* sin(roll) .* cos(yaw) + cos(pitch) .* cos(roll) .* sin(yaw);
g_z = -sin(pitch) .* cos(roll) .* cos(yaw) + cos(pitch) .* sin(roll) .* sin(yaw);

expected_gravity_vector = [g_x, g_y, g_z];