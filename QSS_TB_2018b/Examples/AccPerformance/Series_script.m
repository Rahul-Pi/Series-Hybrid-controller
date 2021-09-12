clear all
clc

%Maps
load Ass2EMmap;     %EM map
load ass2CEgas ;    %ICE map
load qss_eg_original_map

%Initialize battery
N_series = 40;          %Number of series cells
N_parallel = 3;         %Number  of parallel cells
Init_SoC = 15;          %Initial charge of battery [%]
min_SOC=0.30;           %Minimun SOC of the battery when sustainable mode in PHEV[%]
max_SOC=0.50;           %Maximun SOC of the battery when sustainable mode in PHEV[%]

%Initialize vehicle
V_Mass = 1920;            %Curb weight of the vehicle [kg]
Series_add_Mass = 150;    %Additional mass due to parallel configuration
V_area = 3.087;           %Vehicle cross section [m^2]
V_d = 0.35;               %Drag coefficient [-]
V_RRC=0.02;               %Rolling friction coefficient [-]
V_Rotating = 4;           %Rotating mass [%]
V_wheel_dia = 0.739;      %Wheel diameter [m]


%Initialize Gear Box
Gears=1;                    %Number of gears
gear_ratio=[1];             %Gear ratios 
diff_gear=4.533;            %Differential gear
gear_up=[];                 %Up-shifting speeds
gear_down=[];               %Down-shifting speeds
gear_eff=0.98;              %Efficiency
gear_idling_loss=0;         %Idling losses

%Electric Motor Gear Box
EM_gear_ratio=1;            %Electric Motor gear ratio
EM_gear_eta=0.9;            %Electric Motor gear efficiency
EM_idling_loss=0;           %Electric Motor gear idling losses

max_index=find(w_EM_max==round(2150*2*pi/60));              %Finds the index of 2150 RPM as max power occurs at that
max_EM_power_old=T_EM_max(max_index)*w_EM_max(max_index);   %Finding the maximum EM Power currenly in the map

%Electric Motor Specification
max_EM_power=90;                        %Electric Motor Power[kW]

T_EM_col = T_EM_col * max_EM_power*1000/max_EM_power_old;    %Changing the torque vector 
T_EM_max = T_EM_max * max_EM_power*1000/max_EM_power_old;    %Changing the torque vector

%Electric Motor Specification
max_index_1=find(w_EG_max==round(2150*2*pi/60));                %Finds the index of 2150 RPM as max power occurs at that
max_EG_power_old=T_EG_max(max_index_1)*w_EG_max(max_index_1);   %Finding the maximum EG Power currenly in the map
max_EG_power= 40;
T_EG_max = T_EG_max * max_EG_power*1000/max_EG_power_old;    %Changing the torque vector

%Engine Specification
max_CE_power= 60;                                          %Engine Power [kW]

V_d	= max_CE_power*2/((5000/60)*(p_me_max(18)/1000));      % Volume of the engine
T_CE_max = p_me_max*V_d/(2*pi*2);                          % Max torque