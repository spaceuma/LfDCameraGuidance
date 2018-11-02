% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% GMM/GMR framework for Haptic Guidance 
% Training Stage
% Author: Carlos Perez del Pulgar
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 



%% Processing information from kinesthetic movements


Ts=0.006 % Sample time

% Intervals for training the model

% Lever effect
initV1=[161.3 186.8 112.6];
endV1=[161.9 187.2 112.9];
initV2=[50.05 64.05 74.17];
endV2=[50.79 64.75 75.06];
initV3=[132.5 144.3 155.1];
endV3=[134.6 147.2 156.9];
initV4=[110.5  210.3 270.9];
endV4=[112.3  212.3 272.7];

% Signal intevals surface effect
initV5=[81.23 90.17 100.4 110.6 137.7];
endV5=[84.02 92.36 103 112.8 140];
initV6=[51.3 60.38 81 119.4 157.4];
endV6=[54.71 62.55 84.09 122.4 160.2];
initV7=[22.28 46.97 79.64 117.2 142.1];
endV7=[26.3 50.05 84.05 121 145.9];
initV8=[20.59 39.88 60.63 69.43 78.81];
endV8=[23.9 43.76 63.73 72.05 82];

% Forces on opposite surface effect
initV9=[23.67 133.4 64.96 80.86 97.62 105.3];
endV9=[25.04 135.6 66.84 82.89 99.53 107.4];
initV10=[45.16 77.89 133.4 155.2 201.2];
endV10=[47.43 80.69 136.6 158.2 204.6];

initV11=[12.04 23.13 35.83 131.9 200.7];
endV11=[13.85 24.34 37.35 133.4 202.8];
initV12=[37.84 68.02 83.93 113.15];
endV12=[38.98 69.73 85.14 114.8];

% Lever effect with different forces
initV13=[75.56 86.53 97.35 121.1 133.1 182.2];
endV13=[77.58 89.24 98.48 123.8 134.9 183.8];
initV14=[48.46 60.98 71.72 ];
endV14=[50.77 62.29 73.24 ];
initV15=[42.77 54.22 66.01 77.16 131.8 146.4];
endV15=[44.2 55.28 67.23 78.38 133.1 147];
initV16=[47.54 97.84 176.8];
endV16=[47.99 98.88 177.9];
initV17=[17.83 63.43 73.66 84.96 95.9];
endV17=[18.74 63.96 74.83 86.33 96.65];
initV18=[];
endV18=[];
initV19=[69.32 129.4 155.5 180.7 194.9 256.5];
endV19=[69.92 130.2 156 181.8 195.6 257];
initV20=[107.3 134.8 311.6];
endV20=[108.2 135.9 313];

% Obtaining the Position and Forces vectors

% % Lever effect
% [vectorPos1, vectorForce1 ] = GetFile( '.\DataKuka\LogData_151214_1.mat', initV1, endV1, Ts,[1 1 0.75 2 1/4 1] );
% [vectorPos2, vectorForce2 ] = GetFile( '.\DataKuka\LogData_151214_2.mat', initV2, endV2, Ts,[1 1 0.75 1 2 1] );
% [vectorPos3, vectorForce3 ] = GetFile( '.\DataKuka\LogData_151214_3.mat', initV3, endV3, Ts,[1 1 1 1.5 1 1] );
[vectorPos4, vectorForce4 ] = GetFile( '.\DataKuka\LogData_151214_4.mat', initV4, endV4, Ts,[1 1 1 1 3 1]);
% 
% % Forces on surface effect
[vectorPos5, vectorForce5 ] = GetFile( '.\DataKuka\LogData_181214_1.mat', initV5, endV5, Ts,[1/2 1/2 1 1 1 1]);
[vectorPos6, vectorForce6 ] = GetFile( '.\DataKuka\LogData_181214_2.mat', initV6, endV6, Ts,[0.5 0.5 1 1 1 1] );
[vectorPos7, vectorForce7 ] = GetFile( '.\DataKuka\LogData_181214_3.mat', initV7, endV7, Ts,[0.5 0.5 0.5 1 1 1] );
[vectorPos8, vectorForce8 ] = GetFile( '.\DataKuka\LogData_181214_4.mat', initV8, endV8, Ts,[0.5 0.5 0.5 1 1 1] );

% Forces on opposite surface effect
% [vectorPos9, vectorForce9 ] = GetFile( '.\DataKuka\LogData_181214_5.mat', initV9, endV9, Ts,[ 1 1 1 1 1 1 ] );
% [vectorPos10, vectorForce10 ] = GetFile( '.\DataKuka\LogData_181214_6.mat', initV10, endV10, Ts,[ 1 1 1 1 1 1 ] );
% [vectorPos11, vectorForce11 ] = GetFile( '.\DataKuka\LogData_181214_7.mat', initV11, endV11, Ts,[ 1 1 1 1 1 1 ] );
% [vectorPos12, vectorForce12 ] = GetFile( '.\DataKuka\LogData_191214_1.mat', initV12, endV12, Ts,[ 1 1 1 1 1 1 ] );

% Lever effect 27/1/2015
[vectorPos13, vectorForce13 ] = GetFile( '.\DataKuka\LogData_270115_1.mat', initV13, endV13, Ts,[1 1 1 1 1 1] );
[vectorPos14, vectorForce14 ] = GetFile( '.\DataKuka\LogData_270115_2.mat', initV14, endV14, Ts,[1 1 1 1 1 1] );
[vectorPos15, vectorForce15 ] = GetFile( '.\DataKuka\LogData_270115_3.mat', initV15, endV15, Ts,[1 1 1 1 0.75 1] );
[vectorPos16, vectorForce16 ] = GetFile( '.\DataKuka\LogData_270115_4.mat', initV16, endV16, Ts,[1 1 1 1 0.75 1] );
[vectorPos17, vectorForce17 ] = GetFile( '.\DataKuka\LogData_270115_5.mat', initV17, endV17, Ts,[1 1 1 1 0.5 1] );
[vectorPos18, vectorForce18 ] = GetFile( '.\DataKuka\LogData_270115_6.mat', initV18, endV18, Ts,[1 1 1 1 1 1] );
[vectorPos19, vectorForce19 ] = GetFile( '.\DataKuka\LogData_270115_9.mat', initV19, endV19, Ts,[1 1 1 1 1 1] );
[vectorPos20, vectorForce20 ] = GetFile( '.\DataKuka\LogData_270115_8.mat', initV20, endV20, Ts,[1 1 1 1 1 1] );


% Surface contact
vectorPos=[ vectorPos5 vectorPos6 vectorPos7 vectorPos8 ];
vectorForce=[ vectorForce5 vectorForce6 vectorForce7 vectorForce8 ];

% Lever effect
% vectorPos=[ vectorPos13 vectorPos15 vectorPos17 vectorPos4  ];
% vectorForce=[ vectorForce13 vectorForce15 vectorForce17 vectorForce4 ];

%% Generating position and force vectors and training the model


indexTrain=[1:length(vectorPos)];
dataTrain=[];

% Training dataset
for i=indexTrain
    dataTrain=[dataTrain [vectorPos{i}.signals.values(:,1:2) vectorForce{i}.signals.values(:,[1 2])]'];
end

numGauss = 6; 
% Setting the input and output indexes in dataTrain
input   =   [3 4] ;
output  =   [1 2] ;

% Training the model
[priors, mius, covMatrices]=trainingGMM(dataTrain, numGauss );
mu=mius(:,:);
sigma=covMatrices(:,:,:);
BIC = BICscore(dataTrain,mius,covMatrices) %Get the BIC score

%% Representing the trained GMM
figure;
hold on;
plotGMM(mu([1 3],:), sigma([1 3],[1 3],:), [0 .8 0], 1);

for i=1:length(vectorPos)
    xQuery=[vectorForce{i}.signals.values(:,[1])]';
    yQuery=vectorPos{i}.signals.values(:,[1]);
    plot(yQuery,xQuery);
end
figure;
hold on;
plotGMM(mu([2 4],:), sigma([2 4],[2 4],:), [0 .8 0], 1);

for i=1:length(vectorPos)
    xQuery=[vectorForce{i}.signals.values(:,[2])]';
    yQuery=vectorPos{i}.signals.values(:,[2]);
    plot(yQuery,xQuery);
end

%% Comparison between the GMR output (red line) and the real one (blue line)

numVar=4;
miusGMM =  mius( input, :, : );
sigmaGMM = covMatrices( input, input, :, : );

% Variables for Simulink
miusGMR   = reshape( mius, [ numVar 1 * numGauss ] ) ;
sigmaGMR  = reshape( covMatrices, [ numVar numVar 1 * numGauss ] ) ;

for i=1:length(vectorPos)
    xQuery=[vectorForce{i}.signals.values(:,[1 2])]';
    humanQuery=vectorPos{i}.signals.values(:,[1 2]);
    [ yQuery, ySigma ] = gaussianMixtureRegression( xQuery', miusGMR', sigmaGMR, input, output ) ;
    figure;
    hold on
    time=[0:size(yQuery,1)-1] .* Ts;
    subplot(2,1,1);
    hold on
    plot(time,yQuery(:,1),'r');
    plot(time,humanQuery(:,1));
    subplot(2,1,2);
    hold on
    plot(time,yQuery(:,2),'r');
    plot(time,humanQuery(:,2));
end

%% Evaluation of the gesture
miuInput    =   mius([1 2],:,:) ;
covInput    =   covMatrices( [1 2], [1 2], :, : ) ;

dataProbTest=vectorPos{i}.signals.values(:,1:2)';
observProb = gaussianMixture( dataProbTest, priors, miuInput, covInput );
logprob=sum(log(observProb)')'