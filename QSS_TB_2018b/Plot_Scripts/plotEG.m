function plotEG(EGPow, T, w)

% plotEG(EGPow,T,w)
% plotEG makes a scatterplot of the operatingpoints for the EG Assignment.
% Arguments: EGsf = scalefactor of EG, T = Generator torque vector from qss
% w = rotational speed of generator from qss
% Example: plotEG(50,T_EG,w_EG) [plot of a 50 kW generator]
%
% Created by Daniel Härensten 201?-??-??
% Modified by Daniel Härensten 2016-05-26, updated script due to changes in
% EG model.

load qss_eg_original_map
        
    T_EG_col = EGPow / 11.7 * T_EG_col;     % Scale generator torque
    T_EG_max = EGPow / 11.7 * T_EG_max;

figure(102)
    clf
    hold on
    xlabel('Generator speed [rpm]')
    ylabel('Torque [Nm]')
    
    contour(w_EG_row.*30/pi,T_EG_col,eta_EG_map',[0.5:0.05:0.7 0.7:0.01:0.85 0.8555])
    fill([w_EG_max.*(30/pi) max(w_EG_max*(30/pi)) w_EG_max(1)*(30/pi) w_EG_max(1)*(30/pi)] ,[T_EG_max' max(T_EG_col) max(T_EG_col) T_EG_max(1)],'w','edgecolor','white')
    scatter((w.*30/pi),T,'b')
    plot(w_EG_max.*(30/pi),T_EG_max,'k','LineWidth',2)
    axis([w_EG_max(1)*(30/pi) w_EG_max(end)*(30/pi) 0 max(T_EG_col)])
    hold off