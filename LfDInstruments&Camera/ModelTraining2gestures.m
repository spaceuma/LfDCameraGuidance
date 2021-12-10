% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% GMM/GMR framework for Haptic Guidance 
% Training Stage
% Author: Carlos Perez del Pulgar
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

%% 1. Processing information from kinesthetic movements

load('./data/training_data_1');
leftToolPos1 = data{2,2}(:,[1 2 3]);
rightToolPos1 = data{5,2}(:,[1 2 3]);
cameraPos1 = data{8,2}(:,[1 2 3]);

load('./data/training_data_2');
leftToolPos2 = data{2,2}(:,[1 2 3]);
rightToolPos2 = data{5,2}(:,[1 2 3]);
cameraPos2 = data{8,2}(:,[1 2 3]);

load('./data/training_data_3');
leftToolPos3 = data{2,2}(:,[1 2 3]);
rightToolPos3 = data{5,2}(:,[1 2 3]);
cameraPos3 = data{8,2}(:,[1 2 3]);

load('./data/training_data_4');
leftToolPos4 = data{2,2}(:,[1 2 3]);
rightToolPos4 = data{5,2}(:,[1 2 3]);
cameraPos4 = data{8,2}(:,[1 2 3]);

load('./data/training_data_5');
leftToolPos5 = data{2,2}(:,[1 2 3]);
rightToolPos5 = data{5,2}(:,[1 2 3]);
cameraPos5 = data{8,2}(:,[1 2 3]);

load('./data/training_data_6');
leftToolPos6 = data{2,2}(:,[1 2 3]);
rightToolPos6 = data{5,2}(:,[1 2 3]);
cameraPos6 = data{8,2}(:,[1 2 3]);

load('./data/training_data_7');
leftToolPos7 = data{2,2}(:,[1 2 3]);
rightToolPos7 = data{5,2}(:,[1 2 3]);
cameraPos7 = data{8,2}(:,[1 2 3]);

load('./data/training_data_8');
leftToolPos8 = data{2,2}(:,[1 2 3]);
rightToolPos8 = data{5,2}(:,[1 2 3]);
cameraPos8 = data{8,2}(:,[1 2 3]);

load('./data/training_data_9');
leftToolPos9 = data{2,2}(:,[1 2 3]);
rightToolPos9 = data{5,2}(:,[1 2 3]);
cameraPos9 = data{8,2}(:,[1 2 3]);

load('./data/training_data_10');
leftToolPos10 = data{2,2}(:,[1 2 3]);
rightToolPos10 = data{5,2}(:,[1 2 3]);
cameraPos10 = data{8,2}(:,[1 2 3]);

load('./data/training_data_11');
leftToolPos11 = data{2,2}(:,[1 2 3]);
rightToolPos11 = data{5,2}(:,[1 2 3]);
cameraPos11 = data{8,2}(:,[1 2 3]);

load('./data/training_data_12');
leftToolPos12 = data{2,2}(:,[1 2 3]);
rightToolPos12 = data{5,2}(:,[1 2 3]);
cameraPos12 = data{8,2}(:,[1 2 3]);

load('./data/training_data_13');
leftToolPos13 = data{2,2}(:,[1 2 3]);
rightToolPos13 = data{5,2}(:,[1 2 3]);
cameraPos13 = data{8,2}(:,[1 2 3]);

load('./data/training_data_14');
leftToolPos14 = data{2,2}(:,[1 2 3]);
rightToolPos14 = data{5,2}(:,[1 2 3]);
cameraPos14 = data{8,2}(:,[1 2 3]);

load('./data/training_data_15');
leftToolPos15 = data{2,2}(:,[1 2 3]);
rightToolPos15 = data{5,2}(:,[1 2 3]);
cameraPos15 = data{8,2}(:,[1 2 3]);

load('./data/training_data_16');
leftToolPos16 = data{2,2}(:,[1 2 3]);
rightToolPos16 = data{5,2}(:,[1 2 3]);
cameraPos16 = data{8,2}(:,[1 2 3]);

load('./data/training_data_17');
leftToolPos17 = data{2,2}(:,[1 2 3]);
rightToolPos17 = data{5,2}(:,[1 2 3]);
cameraPos17 = data{8,2}(:,[1 2 3]);

load('./data/training_data_18');
leftToolPos18 = data{2,2}(:,[1 2 3]);
rightToolPos18 = data{5,2}(:,[1 2 3]);
cameraPos18 = data{8,2}(:,[1 2 3]);

load('./data/training_data_19');
leftToolPos19 = data{2,2}(:,[1 2 3]);
rightToolPos19 = data{5,2}(:,[1 2 3]);
cameraPos19 = data{8,2}(:,[1 2 3]);

load('./data/training_data_20');
leftToolPos20 = data{2,2}(:,[1 2 3]);
rightToolPos20 = data{5,2}(:,[1 2 3]);
cameraPos20 = data{8,2}(:,[1 2 3]);

load('./data/training_data_21');
leftToolPos21 = data{2,2}(:,[1 2 3]);
rightToolPos21 = data{5,2}(:,[1 2 3]);
cameraPos21 = data{8,2}(:,[1 2 3]);

load('./data/training_data_22');
leftToolPos22 = data{2,2}(:,[1 2 3]);
rightToolPos22 = data{5,2}(:,[1 2 3]);
cameraPos22 = data{8,2}(:,[1 2 3]);
    
load('./data/training_data_23');
leftToolPos23 = data{2,2}(:,[1 2 3]);
rightToolPos23 = data{5,2}(:,[1 2 3]);
cameraPos23 = data{8,2}(:,[1 2 3]);

load('./data/training_data_24');
leftToolPos24 = data{2,2}(:,[1 2 3]);
rightToolPos24 = data{5,2}(:,[1 2 3]);
cameraPos24 = data{8,2}(:,[1 2 3]);

load('./data/training_data_25');
leftToolPos25 = data{2,2}(:,[1 2 3]);
rightToolPos25 = data{5,2}(:,[1 2 3]);
cameraPos25 = data{8,2}(:,[1 2 3]);

load('./data/training_data_26');
leftToolPos26 = data{2,2}(:,[1 2 3]);
rightToolPos26 = data{5,2}(:,[1 2 3]);
cameraPos26 = data{8,2}(:,[1 2 3]);

leftToolPos = [leftToolPos1;leftToolPos2;leftToolPos3;leftToolPos4;leftToolPos5;leftToolPos6;leftToolPos7; ...
      leftToolPos8;leftToolPos9;leftToolPos10;leftToolPos11;leftToolPos12;leftToolPos13;leftToolPos14;leftToolPos15; ...
 leftToolPos16;leftToolPos17;leftToolPos18;leftToolPos19;leftToolPos20;leftToolPos21;leftToolPos22;...
 leftToolPos23;leftToolPos24;leftToolPos25;leftToolPos26]*1000;
rightToolPos = [rightToolPos1;rightToolPos2;rightToolPos3;rightToolPos4;rightToolPos5;rightToolPos6;rightToolPos7;...
     rightToolPos8;rightToolPos9;rightToolPos10;rightToolPos11;rightToolPos12;rightToolPos13;rightToolPos14;rightToolPos15; ...
rightToolPos16;rightToolPos17;rightToolPos18;rightToolPos19;rightToolPos20;rightToolPos21;rightToolPos22;...
 rightToolPos23;rightToolPos24;rightToolPos25;rightToolPos26]*1000;
cameraPos = [cameraPos1;cameraPos2;cameraPos3;cameraPos4;cameraPos5;cameraPos6;cameraPos7;...
     cameraPos8;cameraPos9;cameraPos10;cameraPos11;cameraPos12;cameraPos13;cameraPos14;cameraPos15; ...
cameraPos16;cameraPos17;cameraPos18;cameraPos19;cameraPos20;cameraPos21;cameraPos22;...
 cameraPos23;cameraPos24;cameraPos25;cameraPos26]*1000;


O = [784 102 -436];

for i = 1:1:length(leftToolPos)
    leftToolPos(i,:) = leftToolPos(i,:) - O;
    rightToolPos(i,:) = rightToolPos(i,:) - O;
    cameraPos(i,:)= cameraPos(i,:) - O;
end

%% 2. Training the model

numGauss = 20;
% Setting the input and output indexes in dataTrain
dataTrain = [leftToolPos rightToolPos cameraPos];

input   =   [1 2 3 4 5 6] ;
output  =   [7 8 9] ;

[priors, mius, covMatrices]=trainingGMM(dataTrain', numGauss );
mu=mius(:,:);
sigma=covMatrices(:,:,:);
muGMR=mu';
sigmaGMR=sigma;
