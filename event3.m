
heel_strike_locations;
t = transpose(linspace(0, 17.984, 1785));
%getting time stamps of heel strike 
event_time_stamp = t(heel_strike_locations);

% Create a list of events with their time stamps or positions
events_list = [(event_time_stamp)*99, (1:length(event_time_stamp))'];

% Update the event cell in the EEG data with the new events
EEG.event = [];
EEG.event = struct('type', {}, 'latency', {}, 'urevent', {});
for i = 1:size(events_list, 1)
    if mod(i, 2) == 1 % if i is odd
        EEG.event(i).type = 'HS1';
    else % if i is even
        EEG.event(i).type = 'HS2';
    end
    EEG.event(i).latency = (events_list(i, 1));
    EEG.event(i).urevent = events_list(i, 2);
end

% Save the updated EEG data with the events
pop_saveset(EEG, 'filename', 'eeg_helmet4.set');
