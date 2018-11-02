function [ groupArray ] = groupData( array, elements )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    arraySize=floor( (length(array)/elements) );
    groupArray=zeros(arraySize,1);
    for i=1:arraySize
        begin=(i-1)*elements+1;
        finish=begin+elements-1;
        groupArray(i)=sum(array(begin:finish));
    end

end

