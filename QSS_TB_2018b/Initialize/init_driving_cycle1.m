% ==============
% Driving Cycles
% ==============



% #####################################################################################################################

% Global variables
% ----------------
    global h            % Stepsize [s] for all other blocks
    global N_sim        % Number of computational steps required to complete the simulation of the cycle [-] for all other blocks
    
% #####################################################################################################################

% #####################################################################################################################

% Load data
% ---------

    data = load(char(cyclename1));

    T_z = data.T_z;
    V_z = data.V_z;
    D_z = data.D_z;
    G_z = data.G_z;
    
    clear data

% #####################################################################################################################

% Prepare data (here: to plot a nice picture onto the block)
% ----------------------------------------------------------
    T_zplot = T_z;
    V_zplot = V_z;

    for nnn = length(T_zplot):round(length(T_zplot)*1.25)
       T_zplot(nnn+1) = T_zplot(nnn) + 1;
       V_zplot(nnn+1) = 0;
    end

% #####################################################################################################################

% Store specific data
% -------------------
    if exist('test')
        if test == 1
            stoptime = ceil((v_end-v_init)/3.6/acc_constant);
        else 
            stoptime = T_z(length(T_z));
        end
    else
            stoptime = T_z(length(T_z));
    end

    if autostop == 1
        set_param(char(bdroot(gcb)),'StopTime',num2str(stoptime));
    end     
   
    cl_par = struct('stepsize', stepsize, 'stoptime', stoptime);
    set_param(gcb, 'UserData', cl_par);

% #####################################################################################################################

% Simulation parameters
% ---------------------
    h = stepsize; 
    N_sim = stoptime;
    
% #####################################################################################################################
    
