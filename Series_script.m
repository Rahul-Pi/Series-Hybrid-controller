clear all
clc
close all

%Maps
%EM Map
load Ass2EMmap
%ICE Map
load ass2CEgas
%EG Map
load qss_eg_original_map

%Initialize battery
N_series = 99;              %Number of series cells
N_parallel = 4;             %Number  of parallel cells
Init_SoC = 42;              %Initial charge of battery [%]
min_SOC=0.30;               %Minimum SOC of the battery when sustainable mode in HEV[%]
max_SOC=0.60;               %Maximun SOC of the battery when sustainable mode in HEV[%]
max_battery=0.6*150*1000;   %Max limit of power output from 

%Initialize vehicle
V_Mass = 1920;            %Curb weight of the vehicle [kg]
Series_add_Mass = 250;    %Additional mass due to parallel configuration
V_area = 3.087;           %Vehicle cross section [m^2]
V_d = 0.35;               %Drag coefficient [-]
V_RRC=0.02;               %Rolling friction coefficient [-]
V_Rotating = 4;           %Rotating mass [%]
V_wheel_dia = 0.739;      %Wheel diameter [m]


%Initialize Gear Box
Gears=1;                    %Number of gears
gear_ratio=[1];             %Gear ratios 
diff_gear=4.51;            %Differential gear
gear_up=[];                 %Up-shifting speeds
gear_down=[];               %Down-shifting speeds
gear_eff=0.98;              %Efficiency
gear_idling_loss=0;         %Idling losses

%Electric Motor Gear Box
EM_gear_ratio=1.15;         %Electric Motor gear ratio
EM_gear_eta=0.89;            %Electric Motor gear efficiency
EM_idling_loss=0;           %Electric Motor gear idling losses

max_index=find(w_EM_max==round(2150*2*pi/60));              %Finds the index of 2150 RPM as max power occurs at that
max_EM_power_old=T_EM_max(max_index)*w_EM_max(max_index);   %Finding the maximum EM Power currenly in the map

%Electric Motor Specification
max_EM_power=150;                       %Electric Motor Power[kW]

%Electric Motor Specification
max_EG_power= 35;                       %Electric Generator Power [kW]

%Engine Specification
max_CE_power= 48;                                          %Engine Power [kW]

V_d	= max_CE_power*2/((5000/60)*(p_me_max(18)/1000));      % Volume of the engine

open('Series')
series_sim=sim('Series');

% Plot the operating points
Eng_plot(max_CE_power, series_sim.T_CE, series_sim.w_CE)    %Engine operating point plot
motor_plot(max_EM_power,series_sim.T_EM, series_sim.w_EM)   %Motor operating point plot
Gen_plot(max_EG_power, series_sim.T_EG, series_sim.w_EG)    %Generator operating point plot