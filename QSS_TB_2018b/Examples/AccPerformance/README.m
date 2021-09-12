% ###############################################################################################
%
% =====================================================
% Acceleration Performance Test 0-100 km/h 
% =====================================================
%
%
% Description
% -----------
%   Find the accelertion time for 0-100 km/h.    
%   It should be noted that the result is optimistic, because it does not
%   include any time for gear shifting.
%
% Running the QSS program
% -----------------------
%   1. Change the driving cycle component to the component Driving Cycle 
%      (with performance test possibility).
%   2. Double click the driving cycle component.
%   3. Mark the Acceleration performance test option.
%   4. Set the parameters according to
%       - Start velocity - start_vel
%       - End velocity - end_vel
%       - Constant acceleration - const_acc
%       - Shifting points for upshift - upshift
%       - Shifting points for downshift - downshift
%   5. Open the script-file acctest.m and change filename to the name of
%      your model. For example: filename='qss_saab93_ideal.mdl';
%   6. Change also the number of gears, nog;
%   7. Run the script-file
%
% ###############################################################################################