%Corresponding frequencies for the EEG and the device/s from which you are
%gonna record the event

%FreqEEG=;
%FreqData=;


%First you have to open EEGlab and the EEG data that you are studying 

% Start and End.mat represent your vector containing the events that you
% are gonna to insert in the EEG data

%Start=load("testwalking.edf");
%Start=struct2array(Start);

%End=load("testwalking.edf");


%End=struct2array(End);

%From the EEG struct obtained by EEGlab I need to extract the first event
%from which the events will starts (in my case was the third one)

latency=[EEG.event.latency];
Slatency=latency(3);

 
 %Get the latencies (data point indices) for all 'A' type events...


 %for each A_latencies add a new event type '1' with a latency of (A_latencies(i)+1.5*EEG.srate)-1
   

 for i=1:length(Start);
     n_events=length(EEG.event);
             EEG.event(n_events+1).type=strcat('S', num2str(i));
     
     EEG.event(n_events+1).latency= (Start(i)*FreqData+Slatency*FreqEEG)/FreqEEG;
     EEG.event(n_events+1).urevent=n_events+1;

 end

 for i=1:length(End);
     n_events=length(EEG.event);
     
     EEG.event(n_events+1).type=strcat('E', num2str(i-1));
     
     EEG.event(n_events+1).latency= (End(i)*FreqData+Slatency*FreqEEG)/FreqEEG;
     EEG.event(n_events+1).urevent=n_events+1;

 end

 %Chech with the plot function on EEGlab if the Event are placed correctly.

 