function [ vector ] = SplitVector(data, first, last )
% Split a structure into different pieces

    vector={};
    for i=1:length(first)
        vector{i}=GetInterval(data,first(i),last(i));
    end


end

