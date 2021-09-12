# Series-Hybrid-controller

An ICE based Sports Utility Vehicle is converted to a mild-series hybrid to reduce the fuel consumption.

A simulation based on QSS Toolbox has been created with the controller programmed to start the EGU when the SOC of the battery is below 30% and is turned off when SOC reaches 60%

The QSS model:

<p align="center">
<img src="https://rahulrpai.files.wordpress.com/2021/09/series-2.jpg">
</p>


# Instructions for running the program
Run the Series_script.m file. The simulation will open and also the engine, generator and motor plot will be done automatically
(This uses the Eng_Plot, Gen_plot and the motor_plot scripts in the folder and the plots can be found under the figure folder within the same main folder)

The variation of SOC throughout the driving cycle:

<p align="center">
<img src="https://rahulrpai.files.wordpress.com/2021/09/series-soc.png">
</p>
