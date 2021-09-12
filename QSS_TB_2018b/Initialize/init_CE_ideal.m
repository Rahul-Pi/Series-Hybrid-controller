% ============================================
% Combustion Engine (ideal)
% ============================================



% #####################################################################################################################

% Global variables
% ----------------
    global h                                    % Stepsize [s] from block "Driving Cycle"
    
% #####################################################################################################################

% Load data
% ---------
    
% #####################################################################################################################

% Which engine type?
% ------------------
    switch engine_type

    case 1                                      % -> Otto
        eta_ice         = 0.35;                 % 
    case 2                                      % -> Diesel
        eta_ice         = 0.45;                 % 
    end

    % Which engine type?
% ------------------
    switch recuperation

    case 1                                      % -> No recuperation
        P_CE_recup         = 0;                  % 
    case 2                                      % -> Recuperate all
        P_CE_recup         = -100000;            % Recuperate all energy

    end
    
    if idling == 1
        P_CE_idle         = idle_power;         % Power consumed during idling 
    else
        P_CE_idle         = 0;
    end

% #####################################################################################################################
