clear all;

f_s=100; % sampling frequency
T_s=1/f_s;
t =[-5:T_s:5];

x5 = rect(-t)+(0.5)*rect(-t-1);
plot(t,x5);
axis([-2 2 -1 2]);

xlabel( 'time (sec)' ) ;
ylabel( 'x_5(t)' ) ;
title ('Plot 5: A rectangular pulse');