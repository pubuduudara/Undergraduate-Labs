clear all;
x=[1,2,0,2,1];
h=[1,2,0,2,1];
y=conv(x,h);

n1=1:length(x);
n2=1:length(h);
n3=1:length(y);

subplot(2,2,1);
stem(n1,x)
axis( [0 10 0 10]);
xlabel( 'n');
ylabel('x(n)');

subplot(2,2,2);
stem(n2,h)
axis( [0 10 0 10])
xlabel( 'n');
ylabel('h(n)');


subplot(2,2,3);
stem(n3,y)
axis([0 10 0 10])
xlabel( 'n');
ylabel('y(n)');
