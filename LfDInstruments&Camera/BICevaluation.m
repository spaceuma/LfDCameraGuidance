%% BIC Criterion once ModelTraining2gestures.m has been loaded and executed

%% Evaluation
maxGauss = 10;
numberOfTrainings = 2;
BICVector = zeros(maxGauss, 2);
AICVector = zeros(maxGauss, 2);

for (numGauss = 1:maxGauss)
    numGauss   
    
    [priorsLE, miusLE, covMatricesLE]=trainingGMM(dataTrainLE, numGauss );  
    BICVector(numGauss,1) =  BICscore(dataTrainLE,priorsLE,miusLE,covMatricesLE);    
    AICVector(numGauss,1) =  AICscore(dataTrainLE,priorsLE,miusLE,covMatricesLE);  
    
    [priorsSC, miusSC, covMatricesSC]=trainingGMM(dataTrainSC, numGauss );
    BICVector(numGauss,2) =  BICscore(dataTrainSC,priorsSC,miusSC,covMatricesSC);    
    AICVector(numGauss,2) =  AICscore(dataTrainSC,priorsSC,miusSC,covMatricesSC);    
    
end

%% Plot
figure;
plot(1:maxGauss, BICVector);
title('BIC score');

figure;
plot(1:maxGauss, AICVector);
title('AIC score');

