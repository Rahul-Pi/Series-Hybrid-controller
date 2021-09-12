function [gearratio] = gearbox(u);

switch u(1)
case 0
   gearratio = 0;
case 1
   gearratio = u(2);
case 2
   gearratio = u(3);
case 3
   gearratio = u(4);
case 4
   gearratio = u(5);
case 5
   gearratio = u(6);
case 6
   gearratio = u(7);
case 7
   gearratio = u(8);
case 8
   gearratio = u(9);
case 9
   gearratio = u(10);
case 10
   gearratio = u(11);
case 11
   gearratio = u(12);
case 12
   gearratio = u(13);
case 13
   gearratio = u(14);
case 14
   gearratio = u(15);
case 15
   gearratio = u(16);
case 16
   gearratio = u(17);
otherwise
   disp('no valid input to gearbox');
end

gearratio = gearratio*u(18);