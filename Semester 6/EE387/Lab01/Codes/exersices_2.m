clear all;
n=0:1:4;
h=h(n);
y=[1,2,2.5,3,3,3,2,1,0];
[x,r] = deconv(y,h);

n1=1:length(x);
n2=1:length(h);
n3=1:length(y);

subplot(2,2,1);
stem(n1,x)
axis( [0 9 0 4]);
xlabel( 'n');
ylabel('x(n)');

subplot(2,2,2);
stem(n2,h)
axis( [0 9 0 4]);
xlabel( 'n');
ylabel('h(n)');

subplot(2,2,3);
stem(n3,y)
axis( [0 9 0 4]);
xlabel( 'n');
ylabel('y(n)');
