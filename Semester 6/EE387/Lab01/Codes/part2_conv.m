clear all;
f_s=100; % sampling frequency
T_s=1/f_s;
t =[-5:T_s:5];

x1 = rect(t);
x2 = rect(t-1);

y = conv(x1,x1); %convolution of x1 and x2
t_y = -10:T_s:10; % seperate time axis for signal y
y1 = T_s*conv(x1,x1);

plot(t_y, y1);
axis( [-2 2 -1 2] ) ;
xlabel( 'time (sec)');
ylabel('y_1(t)');
title('Figure : y_1(t) = x_1(t)*x_2(t)');