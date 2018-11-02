% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% GMM/GMR framework for Haptic Guidance 
% Training Stage
% Author: Carlos Perez del Pulgar
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 



%% Processing information from kinesthetic movements

% Obtaining positions of instruments and camera
load('.\data\pegs_13feb_1');
leftToolPos1 = data{2,2}(:,[1 2 3]);
rightToolPos1 = data{5,2}(:,[1 2 3]);
cameraPos1 = data{8,2}(:,[1 2 3]);

load('.\data\pegs_13feb_2');
leftToolPos2 = data{2,2}(:,[1 2 3]);
rightToolPos2 = data{5,2}(:,[1 2 3]);
cameraPos2 = data{8,2}(:,[1 2 3]);

load('.\data\pegs_13feb_3');
leftToolPos3 = data{2,2}(:,[1 2 3]);
rightToolPos3 = data{5,2}(:,[1 2 3]);
cameraPos3 = data{8,2}(:,[1 2 3]);

load('.\data\pegs_13feb_4_1');
leftToolPos4 = data{2,2}(:,[1 2 3]);
rightToolPos4 = data{5,2}(:,[1 2 3]);
cameraPos4 = data{8,2}(:,[1 2 3]);

load('.\data\pegs_13feb_4_2');
leftToolPos5 = data{2,2}(:,[1 2 3]);
rightToolPos5 = data{5,2}(:,[1 2 3]);
cameraPos5 = data{8,2}(:,[1 2 3]);

load('.\data\pegs_13feb_5_1');
leftToolPos6 = data{2,2}(:,[1 2 3]);
rightToolPos6 = data{5,2}(:,[1 2 3]);
cameraPos6 = data{8,2}(:,[1 2 3]);

load('.\data\pegs_13feb_5_2');
leftToolPos7 = data{2,2}(:,[1 2 3]);
rightToolPos7 = data{5,2}(:,[1 2 3]);
cameraPos7 = data{8,2}(:,[1 2 3]);


%Representing movements
figure;
hold on;
plot(leftToolPos1(:,1),leftToolPos1(:,2),'b');
plot(leftToolPos2(:,1),leftToolPos2(:,2),'r');
plot(leftToolPos3(:,1),leftToolPos3(:,2),'g');
plot(leftToolPos4(:,1),leftToolPos4(:,2),'y');
plot(leftToolPos5(:,1),leftToolPos5(:,2),'b');
plot(leftToolPos6(:,1),leftToolPos6(:,2),'r');
plot(leftToolPos7(:,1),leftToolPos7(:,2),'g');
figure;
hold on;
plot(rightToolPos1(:,1),rightToolPos1(:,2),'b');
plot(rightToolPos2(:,1),rightToolPos2(:,2),'r');
plot(rightToolPos3(:,1),rightToolPos3(:,2),'g');
plot(rightToolPos4(:,1),rightToolPos4(:,2),'y');
plot(rightToolPos5(:,1),rightToolPos5(:,2),'m');
plot(rightToolPos6(:,1),rightToolPos6(:,2),'b');
plot(rightToolPos7(:,1),rightToolPos7(:,2),'r');
figure;
hold on;
plot(cameraPos1(:,1),cameraPos1(:,2),'b');
plot(cameraPos2(:,1),cameraPos2(:,2),'r');
plot(cameraPos3(:,1),cameraPos3(:,2),'g');
plot(cameraPos4(:,1),cameraPos4(:,2),'y');
plot(cameraPos5(:,1),cameraPos5(:,2),'m');
plot(cameraPos6(:,1),cameraPos6(:,2),'b');
plot(cameraPos7(:,1),cameraPos7(:,2),'g');

% Complete vectors
leftToolPos = [leftToolPos1;leftToolPos2;leftToolPos3;leftToolPos4;leftToolPos5;leftToolPos6;leftToolPos7];
rightToolPos = [rightToolPos1;rightToolPos2;rightToolPos3;rightToolPos4;rightToolPos5;rightToolPos6;rightToolPos7];
cameraPos = [cameraPos1;cameraPos2;cameraPos3;cameraPos4;cameraPos5;cameraPos6;cameraPos7];


%% Training the model

numGauss = 14;
% Setting the input and output indexes in dataTrain
dataTrain = [leftToolPos rightToolPos cameraPos];
input   =   [1 2 3 4 5 6] ;
output  =   [7 8 9] ;

[priors, mius, covMatrices] = trainingGMM(dataTrain', numGauss );
mu=mius(:,:);
sigma=covMatrices(:,:,:);
muGMR=mu';
sigmaGMR=sigma;


%% Representing the trained GMM

% Left Instrument
figure;
hold on;
plotGMM(mius([1 2],:), covMatrices([1 2],[1 2],:,:), [0 .8 0], 1);
plot(leftToolPos(:,1),leftToolPos(:,2));
title('Left Tool Pos');
xlabel('X (m)');
ylabel('Y (m)');

% Right Instrument
figure;
hold on;
plotGMM(mius([4 5],:), covMatrices([4 5],[4 5],:,:), [0 .8 0], 1);
plot(rightToolPos(:,1),rightToolPos(:,2));
title('Right Tool Pos');
xlabel('X (m)');
ylabel('Y (m)');

% Camera Position
figure;
hold on;
plotGMM(mius([7 8],:), covMatrices([7 8],[7 8],:,:), [0 .8 0], 1);
plot(cameraPos(:,1),cameraPos(:,2));
title('Camera Pos');
xlabel('X (m)');
ylabel('Y (m)');



%% Comparison between the GMR output (red line) and the real one (blue line)


dataRange=[20000:30000]
inputGMRPos = dataTrain(dataRange,input);


[ yQuery, ySigma ] = gaussianMixtureRegression( inputGMRPos, muGMR, sigmaGMR, input, output ) ;

figure;
hold on;
plot([1:length(inputGMRPos)],dataTrain(dataRange,5),'b');
plot([1:length(inputGMRPos)],yQuery(:,1),'r');

figure;
hold on;
plot([1:length(inputGMRPos)],dataTrain(dataRange,6),'b');
plot([1:length(inputGMRPos)],yQuery(:,2),'r');

%% Testing the function
cameraPosTest = getEstimatedCameraPos( [0.8 0.07], [0.8 0.096], muGMR, sigmaGMR, input, output )