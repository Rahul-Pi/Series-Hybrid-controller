% ==============
% Electric Motor
% ==============



% #####################################################################################################################

% Global variables
% ----------------
    global h                            % Stepsize [s] from block "Driving Cycle"
    global eta_EM_map
    global w_EM_row
    global T_EM_col
    global w_EM_max
    global T_EM_max
        
% #####################################################################################################################

% Load data
% ---------
% Modified by Jonas Fredriksson 2009-01-14
% ---------
%    load eta_EM_map                     % Efficiency map                [-]
%    load w_EM_row                       % Motor speed range             [rad/s]
%    load T_EM_col                       % Motor torque range            [Nm]
%    load w_EM_max                       % Maximum motor speed           [rad/s]    
%    load T_EM_max                       % Maximum motor torque          [Nm]

    load Ass2EMmap
    
    theta_EM = 0.1;
    P_aux = 0;
    
    w_EM_upper = max(w_EM_max);         % Upper limit motor speed       [rad/s]
    
    T_EM_col = P_em / 11.7 * T_EM_col;     % Scale motor torque
    T_EM_max = P_em / 11.7 * T_EM_max;

% #####################################################################################################################


