function [ interval ] = GetInterval( data,first,last )
% Create a structure with defined interval

    interval=struct;      
    interval.time=data.time(first:last);
    interval.signals.values=data.signals.values(first:last,:);
    

end

