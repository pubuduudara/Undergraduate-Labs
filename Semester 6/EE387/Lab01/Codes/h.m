function r=h(n)
    r=[];
    count=1;
    for i=n
        if i>=0 && i<4
            r(count)=0.5^i;
        else
            r(count)=0;
        end
    count = count+1;
    end