function Gen_plot(max_EG_power, T, w)

    load qss_eg_original_map
    max_index_1=find(w_EG_max==round(2150*2*pi/60));                %Finds the index of 2150 RPM as max power occurs at that
    max_EG_power_old=T_EG_max(max_index_1)*w_EG_max(max_index_1);   %Finding the maximum EG Power currenly in the map
    
    T_EG_col = max_EG_power *1000 / max_EG_power_old * T_EG_col;
    T_EG_max = max_EG_power *1000 / max_EG_power_old * T_EG_max;


figure(102)
    hold on
    isolines=[0.5:0.1:0.7 0.7:0.02:0.85 0.8555];
    [C,h] = contour(w_EG_row.*(60/(2*pi)),T_EG_col,eta_EG_map',isolines);
    clabel(C,h)
    
    fill([w_EG_max.*(60/(2*pi)) max(w_EG_max*(60/(2*pi))) w_EG_max(1)*(60/(2*pi)) w_EG_max(1)*(60/(2*pi))] ,[T_EG_max' max(T_EG_col) max(T_EG_col) T_EG_max(1)],'w','edgecolor','white')
    scatter((w.*(60/(2*pi))),T,'b')
    plot(w_EG_max.*(60/(2*pi)),T_EG_max,'k','LineWidth',2)
    axis([w_EG_max(1)*(60/(2*pi)) w_EG_max(end)*(60/(2*pi)) 0 max(T_EG_col)])
    xlabel('Generator speed [rpm]')
    ylabel('Torque [Nm]')
    grid on
end