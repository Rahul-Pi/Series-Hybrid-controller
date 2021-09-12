% ============================================
% Combustion Engine (based on consumption map)
% ============================================


 
% #####################################################################################################################

% Global variables
% ----------------
    global h                                    % Stepsize [s] from block "Driving Cycle"
    global eta_CE_map
    global w_CE_row
    global T_CE_col
    global w_CE_max
    global T_CE_max
    global T_CE_min
    
    global theta_CE
    global w_CE_idle
    global P_CE_idle
    global P_aux
    global T_CE_cutoff
    global P_CE_cutoff
    global V_d
       
% #####################################################################################################################

% Load data
% ---------
% Modified by   Jonas Fredriksson 2009-01-14
%               Daniel Härensten 2009-02-13, 2010-01-27, 2014-01-21
% ---------

% New *****************
T_CE_min=xxxx;


    switch engine_type

                   
        case 1                                      % -> Otto
            H_u         = 42.7e6;                   % Bosch-Manual
            rho_f       = 0.745;                    % Bosch-Manual
            load ass2CEgas ;
            theta_CE = 0.5;
            w_CE_idle = 100;
            P_CE_idle = 2500;
            P_aux = 000;
            T_CE_cutoff = 5;
            P_CE_cutoff = 0;
            V_d	= P_ice/40.4/1000;
        

        case 2                                      % -> Diesel
            H_u         = 42.5e6;                   % Bosch-Manual
            rho_f       = 0.84;                     % Bosch-Manual
            load ass2CETDI ;
            theta_CE = 0.5;
            w_CE_idle = 100;
            P_CE_idle = 2500;
            P_aux = 0;
            T_CE_cutoff = 5;
            P_CE_cutoff = 0;
            V_d	= P_ice/58.3/1000;
            
         case 3                                      % -> Diesel
            H_u         = 42.5e6;                   % Bosch-Manual
            rho_f       = 0.84;                     % Bosch-Manual
            load ass2CELD ;
            theta_CE = 0.5;
            w_CE_idle = 60;
            P_CE_idle = 10000;
            P_aux = 0;
            T_CE_cutoff = 25;
            P_CE_cutoff = 0;        
            V_d	= P_ice/25/1000;                    % Displaced volume                          [l] -> [m^3]

    end
        
    w_CE_upper = max(w_CE_max);                % Upper limit engine speed                  [rad/s]
% New *****************
    w_CE_lower = min(w_CE_max);                % Upper limit engine speed                  [rad/s]
     
    for i=1:length(w_CE_row)
        for j=1:length(p_me_col)
            V_CE_map(i,j)=gkWh_CE_map(i,j)/1000/3600*p_me_col(j)*V_d*w_CE_row(i)/2/pi/2/1000;
        end
    end
    
    T_CE_col        = p_me_col .* V_d/(4*pi)   % Torque range                              [Nm]
    T_CE_max        = p_me_max .* V_d/(4*pi)   % Maximum torque                            [Nm]

    T_CE_idle = P_CE_idle / w_CE_idle;          % Torque at idle                            [Nm] 
    