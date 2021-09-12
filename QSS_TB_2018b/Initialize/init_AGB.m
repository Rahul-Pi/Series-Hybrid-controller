% =====================
% Automatic Gear Box (AGB)
% =====================



% #####################################################################################################################

% Global variables
% ----------------
    global h            % Stepsize [s] from block "Driving Cycle"

% #####################################################################################################################

r=d/2; % Wheel radius

son=length(gearon);
soff=length(gearoff);

if son~=(nog-1)
    disp('Inconsistent gearshifting')
elseif soff~=(nog-1)
    disp('Inconsistent gearshifting')
else
    for k=nog+1:1:16
        gearon=[gearon 1000];
        gearoff=[gearoff 1000];
        i(k)=i(k-1);
    end
end