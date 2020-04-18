function x = rect(t)
x=[];
count=1;
for i = t
    if (i>= -0.5 && i<0.5)
        x(count)=1;
    else
        x(count)=0;
    end
    count=count+1;
end



