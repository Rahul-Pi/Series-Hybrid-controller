% ==================
% Electric Generator
% ==================



% #####################################################################################################################

% Global variables
% ----------------
    global h                            % Stepsize [s] from block "Driving Cycle"
    global eta_EG_map
    global w_EG_row
    global T_EG_col
    global w_EG_max
    global T_EG_max
    
% #####################################################################################################################

% Load data
% ---------
% Modified by Jonas Fredriksson 2009-01-14
%             Daniel Härensten 2016-01-18
% ---------
%    load eta_EG_map                     % Efficiency map                    [-]
%    load w_EG_row                       % Generator speed range             [rad/s]
%    load T_EG_col                       % Generator torque range            [Nm]
%    load w_EG_max                       % Maximum generator speed           [rad/s]    
%    load T_EG_max                       % Maximum generator torque          [Nm]

    load qss_eg_original_map
    w_EG_upper = max(w_EG_max);         % Upper limit generator speed       [rad/s]
     
    T_EG_col = P_eg / 11.7 * T_EG_col;     % Scale generator torque
    T_EG_max = P_eg / 11.7 * T_EG_max;

% #####################################################################################################################


