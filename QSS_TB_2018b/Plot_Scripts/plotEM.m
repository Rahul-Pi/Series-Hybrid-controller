function plotEM(EMpow, T, w)

% plotEM(EMpow,T, w, ls)
% plotEM makes a scatterplot of the operatingpoints for the EM Assignment.
% Arguments: EMpow = power of motor in kW, T = Motor torque vector from qss
% w = rotational speed of motor from qss
% Example: plotEM(50,T_EM,w_EM) [plot of a 50 kW motor]
%
% Created by Daniel Härensten 201?-??-??
% Modified by Daniel Härensten 2016-05-26, updated script due to changes in
% EM model.

    load Ass2EMmap
       
    T_EM_col = EMpow / 11.7 * T_EM_col;
    T_EM_max = EMpow / 11.7 * T_EM_max;

figure(101)
    clf
    hold on
    xlabel('Motor speed [rpm]')
    ylabel('Torque [Nm]')
    
    contour(w_EM_row.*30/pi,T_EM_col,eta_EM_map',[0.5:0.05:0.7 0.7:0.01:1 1:0.01:1.2 1.2:0.05:2])
    fill([w_EM_max.*(30/pi) max(w_EM_max*(30/pi)) w_EM_max(1)*(30/pi) w_EM_max(1)*(30/pi)] ,[T_EM_max' max(T_EM_col) max(T_EM_col) T_EM_max(1)],'w','edgecolor','white')
    fill([w_EM_max.*(30/pi) max(w_EM_max*(30/pi)) w_EM_max(1)*(30/pi) w_EM_max(1)*(30/pi)] ,-[T_EM_max' max(T_EM_col) max(T_EM_col) T_EM_max(1)],'w','edgecolor','white')
    scatter((w.*30/pi),T,'b')
    plot(w_EM_max.*(30/pi),T_EM_max,'k','LineWidth',2)
    plot(w_EM_max.*(30/pi),-T_EM_max,'k','LineWidth',2)
    axis([w_EM_max(1)*(30/pi) w_EM_max(end)*(30/pi) -max(T_EM_col) max(T_EM_col)])
    hold off