function [ vel ] = GetVel( pos,ts )
%Get Velocity
%   Inputs: Pos - Position Vector, Ts - Sample Time

vel=zeros(size(pos));
vel(1,:)=[0 0 0 0 0 0];
for i=2:length(pos)
    vel(i,:)= (pos(i,:)-pos(i-1,:)) ./ ts; %Velocity mm/s
end

end

