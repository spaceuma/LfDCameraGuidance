% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% GMM/GMR framework for Haptic Guidance 
% Training Stage
% Author: Carlos Perez del Pulgar
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 



% Processing information from kinesthetic movements

% Obtaining positions of instruments and camera
load('./data/pegsMarzo_1_0');
leftToolPos1 = data{2,2}(:,[1 2 3]);
rightToolPos1 = data{5,2}(:,[1 2 3]);
cameraPos1 = data{8,2}(:,[1 2 3]);

load('./data/pegsMarzo_1_1');
leftToolPos2 = data{2,2}(:,[1 2 3]);
rightToolPos2 = data{5,2}(:,[1 2 3]);
cameraPos2 = data{8,2}(:,[1 2 3]);

load('./data/pegsMarzo_2_0');
leftToolPos3 = data{2,2}(:,[1 2 3]);
rightToolPos3 = data{5,2}(:,[1 2 3]);
cameraPos3 = data{8,2}(:,[1 2 3]);

load('./data/pegsMarzo_3_0');
leftToolPos4 = data{2,2}(:,[1 2 3]);
rightToolPos4 = data{5,2}(:,[1 2 3]);
cameraPos4 = data{8,2}(:,[1 2 3]);

load('./data/pegsMarzo_4_0');
leftToolPos5 = data{2,2}(:,[1 2 3]);
rightToolPos5 = data{5,2}(:,[1 2 3]);
cameraPos5 = data{8,2}(:,[1 2 3]);

load('./data/pegsMarzo_5_0');
leftToolPos6 = data{2,2}(:,[1 2 3]);
rightToolPos6 = data{5,2}(:,[1 2 3]);
cameraPos6 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_1_0');
leftToolPos7 = data{2,2}(:,[1 2 3]);
rightToolPos7 = data{5,2}(:,[1 2 3]);
cameraPos7 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_1_1');
leftToolPos8 = data{2,2}(:,[1 2 3]);
rightToolPos8 = data{5,2}(:,[1 2 3]);
cameraPos8 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_2_0');
leftToolPos9 = data{2,2}(:,[1 2 3]);
rightToolPos9 = data{5,2}(:,[1 2 3]);
cameraPos9 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_2_1');
leftToolPos10 = data{2,2}(:,[1 2 3]);
rightToolPos10 = data{5,2}(:,[1 2 3]);
cameraPos10 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_3_0');
leftToolPos11 = data{2,2}(:,[1 2 3]);
rightToolPos11 = data{5,2}(:,[1 2 3]);
cameraPos11 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_3_1');
leftToolPos12 = data{2,2}(:,[1 2 3]);
rightToolPos12 = data{5,2}(:,[1 2 3]);
cameraPos12 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_3_2');
leftToolPos13 = data{2,2}(:,[1 2 3]);
rightToolPos13 = data{5,2}(:,[1 2 3]);
cameraPos13 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_3_3');
leftToolPos14 = data{2,2}(:,[1 2 3]);
rightToolPos14 = data{5,2}(:,[1 2 3]);
cameraPos14 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_4_0');
leftToolPos15 = data{2,2}(:,[1 2 3]);
rightToolPos15 = data{5,2}(:,[1 2 3]);
cameraPos15 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_4_1');
leftToolPos16 = data{2,2}(:,[1 2 3]);
rightToolPos16 = data{5,2}(:,[1 2 3]);
cameraPos16 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_4_2');
leftToolPos17 = data{2,2}(:,[1 2 3]);
rightToolPos17 = data{5,2}(:,[1 2 3]);
cameraPos17 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_4_3');
leftToolPos18 = data{2,2}(:,[1 2 3]);
rightToolPos18 = data{5,2}(:,[1 2 3]);
cameraPos18 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_5_0');
leftToolPos19 = data{2,2}(:,[1 2 3]);
rightToolPos19 = data{5,2}(:,[1 2 3]);
cameraPos19 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_5_1');
leftToolPos20 = data{2,2}(:,[1 2 3]);
rightToolPos20 = data{5,2}(:,[1 2 3]);
cameraPos20 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_5_2');
leftToolPos21 = data{2,2}(:,[1 2 3]);
rightToolPos21 = data{5,2}(:,[1 2 3]);
cameraPos21 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_6_0');
leftToolPos22 = data{2,2}(:,[1 2 3]);
rightToolPos22 = data{5,2}(:,[1 2 3]);
cameraPos22 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_6_1');
leftToolPos23 = data{2,2}(:,[1 2 3]);
rightToolPos23 = data{5,2}(:,[1 2 3]);
cameraPos23 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_6_2');
leftToolPos24 = data{2,2}(:,[1 2 3]);
rightToolPos24 = data{5,2}(:,[1 2 3]);
cameraPos24 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_6_3');
leftToolPos25 = data{2,2}(:,[1 2 3]);
rightToolPos25 = data{5,2}(:,[1 2 3]);
cameraPos25 = data{8,2}(:,[1 2 3]);

load('./data/pegstrain23feb_6_4');
leftToolPos26 = data{2,2}(:,[1 2 3]);
rightToolPos26 = data{5,2}(:,[1 2 3]);
cameraPos26 = data{8,2}(:,[1 2 3]);



%Representing movements
% figure;
% hold on;
% plot(leftToolPos1(:,1),leftToolPos1(:,2));%,'b');
% plot(leftToolPos2(:,1),leftToolPos2(:,2));%,'r');
% plot(leftToolPos3(:,1),leftToolPos3(:,2));%,'g');
% plot(leftToolPos4(:,1),leftToolPos4(:,2));%,'y');
% plot(leftToolPos5(:,1),leftToolPos5(:,2));%,'b');
% plot(leftToolPos6(:,1),leftToolPos6(:,2));%,'r');
% % plot(leftToolPos7(:,1),leftToolPos7(:,2));%,'g');
% % plot(leftToolPos8(:,1),leftToolPos8(:,2));
% figure;
% hold on;
% plot(rightToolPos1(:,1),rightToolPos1(:,2));%,'b');
% plot(rightToolPos2(:,1),rightToolPos2(:,2));%,'r');
% plot(rightToolPos3(:,1),rightToolPos3(:,2));%,'g');
% plot(rightToolPos4(:,1),rightToolPos4(:,2));%,'y');
% plot(rightToolPos5(:,1),rightToolPos5(:,2));%,'m');
% plot(rightToolPos6(:,1),rightToolPos6(:,2));%,'b');
% % plot(rightToolPos7(:,1),rightToolPos7(:,2));%,'r');
% % plot(rightToolPos8(:,1),rightToolPos8(:,2));
% figure;
% hold on;
% plot(cameraPos1(:,1),cameraPos1(:,2));%,'b');
% plot(cameraPos2(:,1),cameraPos2(:,2));%,'r');
% plot(cameraPos3(:,1),cameraPos3(:,2));%,'g');
% plot(cameraPos4(:,1),cameraPos4(:,2));%,'y');
% plot(cameraPos5(:,1),cameraPos5(:,2));%,'m');
% plot(cameraPos6(:,1),cameraPos6(:,2));%,'b');
% % plot(cameraPos7(:,1),cameraPos7(:,2));%,'g');
% % plot(cameraPos8(:,1),cameraPos8(:,2));

% Complete vectors
leftToolPos = [leftToolPos1;leftToolPos2;leftToolPos3;leftToolPos4;leftToolPos5;leftToolPos6;leftToolPos7; ...
      leftToolPos8;leftToolPos9;leftToolPos10;leftToolPos11;leftToolPos12;leftToolPos13;leftToolPos14;leftToolPos15; ...
 leftToolPos16;leftToolPos17;leftToolPos18;leftToolPos19;leftToolPos20;leftToolPos21;leftToolPos22;...
 leftToolPos23;leftToolPos24;leftToolPos25;leftToolPos26];
rightToolPos = [rightToolPos1;rightToolPos2;rightToolPos3;rightToolPos4;rightToolPos5;rightToolPos6;rightToolPos7;...
     rightToolPos8;rightToolPos9;rightToolPos10;rightToolPos11;rightToolPos12;rightToolPos13;rightToolPos14;rightToolPos15; ...
rightToolPos16;rightToolPos17;rightToolPos18;rightToolPos19;rightToolPos20;rightToolPos21;rightToolPos22;...
 rightToolPos23;rightToolPos24;rightToolPos25;rightToolPos26];
cameraPos = [cameraPos1;cameraPos2;cameraPos3;cameraPos4;cameraPos5;cameraPos6;cameraPos7;...
     cameraPos8;cameraPos9;cameraPos10;cameraPos11;cameraPos12;cameraPos13;cameraPos14;cameraPos15; ...
cameraPos16;cameraPos17;cameraPos18;cameraPos19;cameraPos20;cameraPos21;cameraPos22;...
 cameraPos23;cameraPos24;cameraPos25;cameraPos26];


%% Training the model

numGauss = 20;
% Setting the input and output indexes in dataTrain
dataTrain = [leftToolPos rightToolPos cameraPos];
%% Entrenamiento único de las tres componentes
input   =   [1 2 3 4 5 6] ;
output  =   [7 8 9] ;
%% Entrenamiento en componentes XY
% input   =   [1 2 4 5] ;
% output  =   [7 8] ;

[priors, mius, covMatrices]=trainingGMM(dataTrain', numGauss );
mu=mius(:,:);
sigma=covMatrices(:,:,:);
muGMR=mu';
sigmaGMR=sigma;


%% Representing the trained GMM

% Left Instrument
figure;
hold on;
plotGMM(mius([1 2],:), covMatrices([1 2],[1 2],:,:), [0 .8 0], 1);
plot(leftToolPos(:,1),leftToolPos(:,2),'b');

h = zeros(2, 1);
h(1) = plot(NaN,NaN,'b');
h(2) = plot(NaN,NaN,'og');
legend(h,'Training trayectories','GMM');

%title('Left Tool Training');
xlabel('X (m)');
ylabel('Y (m)');


% Right Instrument
figure;
hold on;
plotGMM(mius([4 5],:), covMatrices([4 5],[4 5],:,:), [0 .8 0], 1);
plot(rightToolPos(:,1),rightToolPos(:,2),'b');

h = zeros(2, 1);
h(1) = plot(NaN,NaN,'b');
h(2) = plot(NaN,NaN,'og');
legend(h,'Training trayectories','GMM');

%title('Right Tool Training');
xlabel('X (m)');
ylabel('Y (m)');

% Camera Position
figure;
hold on;
plotGMM(mius([7 8],:), covMatrices([7 8],[7 8],:,:), [0 .8 0], 1);
plot(cameraPos(:,1),cameraPos(:,2),'b');
h = zeros(2, 1);
h(1) = plot(NaN,NaN,'b');
h(2) = plot(NaN,NaN,'og');
legend(h,'Training trayectories','GMM');

%title('Camera Position Training');
xlabel('X (m)');
ylabel('Y (m)');



%% Comparison between the GMR output (red line) and the real one (blue line)


dataRange=[20000:30000];
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
cameraPosTest = getEstimatedCameraPos( [0.82 0.08 -0.1], [0.8 0.08 -0.1], muGMR, sigmaGMR, input, output );