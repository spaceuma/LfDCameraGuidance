function [ output ] = Adjust( input )
% Adjust the vector to the maximum value
 maximumvect=max(abs(input));
 maximum=max(maximumvect);
 
 A=repmat(maximum,size(input,1),size(input,2));
 output=input./A;

end

