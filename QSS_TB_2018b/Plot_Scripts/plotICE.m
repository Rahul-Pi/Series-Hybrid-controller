function plotICE(ICEpow, engine_type, T, w, ls)

% plotICE(ICEpow, engine_type, T, w, ls)
% plotICE makes a scatterplot of the operatingpoints for CE Assignment.
% Arguments are: ICEpow = power of ICE in kW, 
% engine_type (1=otto, 2=diesel,3=Heavy Duty diesel), 
% T = Engine torque vector, w = rotational speed of engine from qss
% simulation. ls = distance between bsfc-labels (0 = no labels)
% Example: plotICE(100,1,T_CE,w_CE,100) [100 kW Otto with bsfc-labels]
% Example: plotICE(50,2,T_CE,w_CE,0) [50 kW Diesel with no bsfc-labels]
%
% Created by Daniel Härensten 201?-??-??
% Modified by Daniel Härensten 2016-05-26, updated script due to changes of
% ICE model.

switch engine_type;
    case 1                                           % -> Otto
        load ass2CEgas ;
        V_d	= ICEpow/40.4/1000;
    case 2                                           % -> Diesel
        load ass2CETDI ;
        V_d	= ICEpow/58.3/1000;
    case 3
        load ass2CELD ;
        V_d = ICEpow/25/1000 ;
end
  
    T_CE_col        = p_me_col .* V_d/(4*pi);   % Torque range                              [Nm]
    T_CE_max        = p_me_max .* V_d/(4*pi);   % Maximum torque                            [Nm]

figure(100)
    clf
    hold on
    xlabel('Engine speed [rpm]')
    ylabel('Torque [Nm]')
    
    
    switch engine_type
        case 1
            [C,h] = contour(w_CE_row*30/pi,T_CE_col,gkWh_CE_map',[2:0.1:3 3.25:0.25:3.5 4:7]*100);
        case 2
            [C,h] = contour(w_CE_row*30/pi,T_CE_col,gkWh_CE_map',[2 2.02 2.05:0.1:2.45 2.7 3.0 4:7]*100);
    end
    
    clabel(C,h,'LabelSpacing',ls)
    fill([w_CE_max.*(30/pi) max(w_CE_max.*(30/pi)) w_CE_max(1)*(30/pi) w_CE_max(1)*(30/pi)] ,[T_CE_max max(T_CE_max) max(T_CE_max) T_CE_max(1)],'w','edgecolor','white')
    plot(w_CE_max.*(30/pi),T_CE_max,'k','LineWidth',2)
    scatter(w.*(30/pi),T,'b')
    axis([w_CE_max(1)*(30/pi) w_CE_max(end)*(30/pi) 0 max(T_CE_max)])
    
    hold off