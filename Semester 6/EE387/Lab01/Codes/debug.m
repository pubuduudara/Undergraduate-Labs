clear all;
Ts=0.01; 
t= -5:Ts:5;

y1 = ramp(t,1,3);
y2 = ramp(t,1,1);
y3 = ramp(t,1,0);
y4 = ustep(t,-3);
y = y1-2*y2+3*y3-y4;

plot(t,y,'k'); 
xlabel( 'time' ) ;
ylabel( 'y(t)' ) ;


