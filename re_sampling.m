% Initialize the resampled_data cell array
resampled_data = cell(44, 1);

for i=1:41
 
    if mod(i,2)==1
% Define the original data matrix
data{i, 1} ;

% Define the original sampling rate (in Hz)
original_fs = 99;

% Define the target sampling rate (in Hz)
target_fs = 99;

% Define the new length of the data matrix
new_length = 101;

% Calculate the resampling factor
resampling_factor  = target_fs / original_fs;

% Use the resample function to resample the data
resampled_data{i, 1} = resample(data{i, 1}, new_length, size(data{i, 1}, 1));

% Verify the new size of the data matrix
%assert(size(resampled_data1, 1) == new_length);

% Verify the new sampling rate
%assert(abs(target_fs - original_fs * size(data, 1) / size(resampled_data, 1)) < 1e-10);
   end 
end