function motor_plot(max_EM_power, T, w)
    load Ass2EMmap;     %EM map
    
    max_index_1=find(w_EM_max==round(2150*2*pi/60));                %Finds the index of 2150 RPM as max power occurs at that
    max_EM_power_old=T_EM_max(max_index_1)*w_EM_max(max_index_1);   %Finding the maximum EG Power currenly in the map
    
    T_EM_col = max_EM_power *1000 / max_EM_power_old * T_EM_col;
    T_EM_max = max_EM_power *1000 / max_EM_power_old * T_EM_max;
    
    figure(101)
    clf
    isolines=[0.5:0.1:0.7 0.7:0.05:1 1:0.05:1.2 1.2:0.1:2];
    [C,h] = contour(w_EM_row.*(60/(2*pi)),T_EM_col,eta_EM_map',isolines);
    clabel(C,h)
    hold on
    fill([w_EM_max.*(30/pi) max(w_EM_max*(30/pi)) w_EM_max(1)*(30/pi) w_EM_max(1)*(30/pi)] ,[T_EM_max' max(T_EM_col) max(T_EM_col) T_EM_max(1)],'w','edgecolor','white')
    fill([w_EM_max.*(30/pi) max(w_EM_max*(30/pi)) w_EM_max(1)*(30/pi) w_EM_max(1)*(30/pi)] ,-[T_EM_max' max(T_EM_col) max(T_EM_col) T_EM_max(1)],'w','edgecolor','white')
    scatter((w.*30/pi),T,'b')
    plot(w_EM_max.*(30/pi),T_EM_max,'k','LineWidth',2)
    plot(w_EM_max.*(30/pi),-T_EM_max,'k','LineWidth',2)
    xlabel('Motor speed [rpm]')
    ylabel('Torque [Nm]')
end