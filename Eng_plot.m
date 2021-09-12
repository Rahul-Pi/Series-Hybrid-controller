function Eng_plot(max_CE_power, T, w)
load ass2CEgas ;    %ICE map

V_d	= max_CE_power*2/((5000/60)*(p_me_max(18)/1000));       % Volume of the engine
T_CE_max = p_me_max.*V_d/(2*pi*2);                          % Max torque
T_CE_col = p_me_col.*V_d/(2*pi*2);                          % Max torque

figure(100)
    [wMatrix, pMatrix] = meshgrid(w_CE_row*60/(2*pi), T_CE_col); %creates a coordinate grid
    isoLines=[4:7 3.25:0.25:3.5 2:0.1:3]*100;
    [C,h] = contour(wMatrix, pMatrix, gkWh_CE_map', isoLines);
    patch([w_CE_row*60/(2*pi), w_CE_row(end:-1:1)*60/(2*pi)],... %turn w_row around - Clears the isolines above the max load line
        [T_CE_max, ones(1,length(T_CE_max))*120],'w','EdgeColor','w');
    clabel(C,h);
    hold on;
    grid on
    plot(w_CE_max*60/(2*pi), T_CE_max,'b','Linewidth', 0.5)
    scatter(w.*(60/(2*pi)),T,'r')
    xlabel('Engine speed [rpm]')
    ylabel('Torque [Nm]')
end