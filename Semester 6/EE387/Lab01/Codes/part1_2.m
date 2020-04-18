clear all;
Ts=0.01; 
t= -5:Ts:5;
y=[];
count=1;

for i=t
    y(count)=3*exp(-i)*cos(4*pi*i);
    count=count+1;
end

[yupper,ylower]=envelope(y);
figure(1)
plot(t,y);
hold on;
plot(t,yupper);
plot(t,ylower);
grid;


[yupper,ylower] = envelope(y,30,'peak')
figure(1)
plot(t,y); hold on;
plot(t,yupper);
plot(t,ylower);
grid;
xlabel('t'); ylabel('x(t)')
