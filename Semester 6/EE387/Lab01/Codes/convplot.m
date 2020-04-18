function y=convplot(x,h)
    y=conv(x,h);

    n1=1:length(x);
    n2=1:length(h);
    n3=1:length(y);

    subplot(2,2,1);
    stem(n1,x);
    axis( [0 length(x)+1 0 max(x)+1]);
    xlabel( 'n');
    ylabel('x(n)');

    subplot(2,2,2);
    stem(n2,h);
    axis( [0 length(h)+1 0 max(h)+1])
    xlabel( 'n');
    ylabel('h(n)');


    subplot(2,2,3);
    stem(n3,y);
    axis( [0 length(y)+1 0 max(y)+1])
    xlabel( 'n');
    ylabel('y(n)');
