function [ vectorPos, vectorForce ] = GetFile( filename, initf, endf, Ts, Kforces )
% Get information from dataset


load(filename);

%Change from 1ms to Ts
[row col Data]=find(mod(LogData(1,:),Ts)==0);
data=LogData(:,col);

% Change from m to mm
pos=struct;
pos.time=data(1,:)';
pos.signals.values=data(2:13,:)';
pos.signals.values(:,4)=pos.signals.values(:,4).*1000;
pos.signals.values(:,8)=pos.signals.values(:,8).*1000;
pos.signals.values(:,12)=pos.signals.values(:,12).*1000;

% Generation ZYZ Euler tuple (pos,or)
posZYZ=struct;
posZYZ.time=data(1,:)';
posZYZ.signals.values=zeros(length(pos.signals.values),6);
posZYZ.signals.values(:,1)=pos.signals.values(:,4);
posZYZ.signals.values(:,2)=pos.signals.values(:,8);
posZYZ.signals.values(:,3)=pos.signals.values(:,12);

% Calculating orientation from Transformation matrix
for i=1:length(pos.signals.values)
    posZYZ.signals.values(i,:)=T2X([reshape(pos.signals.values(i,:),4,3)';0 0 0 1]);
%     mataux=reshape(pos.signals.values(i,:),4,3)';
%     [posZYZ.signals.values(i,4), posZYZ.signals.values(i,5), posZYZ.signals.values(i,6)]=dcm2angle(mataux(1:3,1:3),'ZYZ');
end


% Calculating Forces
forces=struct;
forces.time=data(1,:)';
forces.signals.values=data(14:19,:)';
forces.signals.values=forces.signals.values .* (ones(size(forces.signals.values,1),1) * Kforces); % Parameter multiply

% Calculating velocity
vel=struct;
vel.time=data(1,:);
vel.signals.values=GetVel(posZYZ.signals.values,Ts);

velforces=struct;
velforces.time=data(1,:);
velforces.signals.values=GetVel(forces.signals.values,Ts);

% Plot position
figure;
subplot(3,1,1);
plot(posZYZ.time,posZYZ.signals.values(:,1));
title('Position');
subplot(3,1,2);
plot(posZYZ.time,posZYZ.signals.values(:,2));
subplot(3,1,3);
plot(posZYZ.time,posZYZ.signals.values(:,3));

% Plot Forces and Torques
figure;
subplot(4,1,1);
plot(forces.time,forces.signals.values(:,1));
title('Fx Fy Fz Tx Ty');
subplot(5,1,2);
plot(forces.time,forces.signals.values(:,2));
subplot(5,1,3);
plot(forces.time,forces.signals.values(:,3));
subplot(5,1,4);
plot(forces.time,forces.signals.values(:,4));
subplot(5,1,5);
plot(forces.time,forces.signals.values(:,5));

% Split structures into insertion and extraction movements
initV=(initf-posZYZ.time(1))./Ts+1;
endV=(endf-posZYZ.time(1))./Ts+1;
vectorPos=SplitVector(posZYZ,initV,endV);
vectorForce=SplitVector(forces,initV,endV);


% Making position be referenced to the final value
for i=1:length(vectorPos)
    long=length(vectorPos{i}.signals.values);
    vectorPos{i}.signals.values(:,1:3)=repmat(vectorPos{i}.signals.values(long,1:3),long,1)-vectorPos{i}.signals.values(:,1:3);
%     changed to adapt to read forces/torques
    vectorPos{i}.signals.values(:,1)=-vectorPos{i}.signals.values(:,1);
    
%     Normalise data
    vectorPos{i}.signals.values(:,1:2)=Adjust(vectorPos{i}.signals.values(:,1:2));
    
end

% figure;
% title('Ty vd Px');
% for i=1:length(vectorPos)    
%     hold on;
%     plot(vectorForce{i}.signals.values(:,5),vectorPos{i}.signals.values(:,1),'Marker','x','Color',[0 i/max(length(vectorPos)) i/max(length(vectorPos))]);    
% end
% figure;
% title('Tx vd Py');
% for i=1:length(vectorPos)    
%     hold on;
%     plot(vectorForce{i}.signals.values(:,4),vectorPos{i}.signals.values(:,2),'Marker','x','Color',[0 i/max(length(vectorPos)) i/max(length(vectorPos))]);    
% end


end






