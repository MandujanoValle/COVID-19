%%%---PARAMETER IDENTIFICATION PROBLEM IN THE GOMPERTZ MODEL---%%%
%%%------------------------------------------------------------%%%
%                    Gomprtz Model                               %
%       |--------------------------------                        %
%       | N_t   =r N ln(K/N)                                     %
%       | N(t_0)=N_0                                             %
%       |--------------------------------                        %
%----------------------------------------------------------------%

clc;close all;clear all 
global ti T N                                          
%---    Import data of cases or deaths by COVID1-9           ---%|
N=importdata('Data/RJ-deaths.txt'); N=N';                        %|
                                                                %|
%---                Enter country or state                   ---%|
country='Rio de Janeiro';   abbreviation='RJ';                  %|
                                                                %|
%---      Enter 1=cases infected or 2=deaths                 ---%|
cases_deaths=2;                                                 %|
                                                                %|
%---      Final time year-moth-day((yyyy,MM,DD)              ---%|
year=2020; month=07; day=02                     ;               %|
                                                                %|
%---                   Consider ti=1                         ---%|
ti=1;                                                           %|
%---------------------------------------------------------------%|

%---             to determine the discrete-time               ---%
T=length(N); 
[time time_data time_f_data]=Months(year,month,day);

%---              Guess initial                               ---%
Kk=1.2*max(N);  ak=log(Kk);
rk=( N(T)-N(T-1) )/( N(T-1)*log( Kk/N(T-1) ) );                 

%---                 Minimal error method                     ---%
[a r R2]=MinimalError(ak,rk);

%---                a=ln(K), then K=exp(a)                    ---%
K=exp(a);

%---      Basic reproduction number with 14 and 28 days       ---%
R0_14=exp(r*14);   R0_28=exp(r*28);   

%---                inflection point                          ---%
t_i_p=ti + round( log( a-log(N(1) ) )/r );

data_tip=time(t_i_p);

%---                      Figures                             ---%
tt=linspace(ti,length(time),length(time));
Nk=exp( a+(log(N(1))-a)*exp( -r*(tt-ti) ) );
Figures(time_data,N,time,Nk,t_i_p,time_f_data,...
data_tip,K,country,abbreviation,cases_deaths)

%---                    Print values                          ---%
Print(K,r,R2,data_tip,R0_14,R0_28,...
Nk,cases_deaths,country);

%---               Save Data: time, N and Nk                  ---%
N=N'; Nk=round(Nk'); time=time';
T=table(time,Nk);
if(cases_deaths==1)
writetable(T,sprintf('%s-Cases.xlsx',abbreviation)); end
if(cases_deaths==2)
writetable(T,sprintf('%s-Deaths.xlsx',abbreviation)); end
