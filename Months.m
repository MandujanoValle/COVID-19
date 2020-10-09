%%------------------         Days        ---------------%%
function [time time_data time_f_data]=Months(year,month,day);
global T
%--     To determine days for data and prediction      --%
time_f_data=datetime(year,month,day,'format','dd-MMM');
time_i     =time_f_data+1-T; 
end_data=time_f_data+7;
time=time_i:end_data;
time_data=time(1:T);
