clear all
clc

%Maps
load Ass2EMmap; %EM map
load ass2CEgas ; %ICE map

% SUV

%Initialize battery
N_series = 26;         %Number of series cells
N_parallel = 2;         %Number  of parallel cells
Init_SoC = 15;          %Initial charge of battery [%]
min_SOC=0.35;             %Minimun SOC of the battery when sustainable mode in PHEV[%]
max_SOC=0.60;             %Maximun SOC of the battery when sustainable mode in PHEV[%]

%Initialize vehicle
V_Mass = 1920;               %Curb weight of the vehicle [kg]
Parallel_add_Mass = 150;    %Additional mass due to parallel configuration
V_area = 3.087;               %Vehicle cross section [m^2]
V_d = 0.35;                 %Drag coefficient [-]
V_RRC=0.02;                 %Rolling friction coefficient [-]
V_Rotating = 4;             %Rotating mass [%]
V_wheel_dia = 0.739;        %Wheel diameter [m]


%Initialize Gear Box
Gears=6;                                        %Number of gears
% gear_ratio=[3.583 1.905 1.194 0.838 0.652 0.5];     %Gear ratios 
% diff_gear=4.533;                                 %Differential gear
% gear_up=[15 25 40 70 100];                          %Up-shifting speeds
% gear_down=[2 15 30 50 80];                         %Down-shifting speeds
% gear_eff=0.85;                                  %Efficiency
% gear_idling_loss=300;                           %Idling losses
gear_ratio=[3.6657 2.4933 1.7945 1.3201 0.9386 0.6875]; %Gear ratios
diff_gear=3.89;                                         %Differential gear
gear_up=[9.6305 35.4860 46.8741 82.1634 170.9009];      %Up-shifting speeds
gear_down=[2.1238 16.0393 30.2609 60.0625 97.9696];     %Down-shifting speeds
gear_eff=0.95;                                          %Efficiency
gear_idling_loss=300;                                   %Idling losses

%Electric Motor Gear Box
EM_gear_ratio=4.533;                        %Electric Motor gear ratio
EM_gear_eta=0.98;                       %Electric Motor gear efficiency
EM_idling_loss=0;                       %Electric Motor gear idling losses

max_index=find(w_EM_max==round(2150*2*pi/60));          %Finds the index of 2150 RPM as max power occurs at that
max_EM_power_old=T_EM_max(max_index)*w_EM_max(max_index);   %Finding the maximum EM Power currenly in the map

%Electric Motor Specification
max_EM_power=84;                        %Electric Motor Power[kW]

T_EM_col = T_EM_col * max_EM_power*1000/max_EM_power_old;    %Changing the torque vector 
T_EM_max = T_EM_max * max_EM_power*1000/max_EM_power_old;    %Changing the torque vector

%Engine Specification
max_CE_power= 100;                                          %Engine Power [kW]

w_CE_min = 105;                                             %Minimum Speed to run ICE [rad/s]

V_d	= max_CE_power*2/((5000/60)*(p_me_max(18)/1000));

T_CE_max = p_me_max*V_d/(2*pi*2);                           % Max torque