
function y = ustep(t,ad)
% ad: advance (positive), delay (negative) factor
% t: length of time
y=[];
count=1;
for i =t
    if i< (-1*ad)
        y(count)=0;
    else
        y(count)=1;
    end
    count=count+1;
end

