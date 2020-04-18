
function y = ramp(t,m,ad)
% t: length of time
% m: slope of the ramp function
% ad: advance (positive), delay (negative) factor
y=[];
count=1;
p=-(ad/m);
for i=t
    if(m>0)
        if i< p
            y(count)=0;
        else
            y(count)=m*i + ad;
        end
    
        
    else
        if i< p
            y(count)=m*i + ad;
        else
            y(count)=0;
        end
    end
    count=count+1;
end




