%% BIC Criterion once ModelTraining2gestures.m has been loaded and executed

%% Evaluation
maxGauss = 35;
numberOfTrainings = 2;
BICVector = zeros(maxGauss, 2);
AICVector = zeros(maxGauss, 2);

for (numGauss = 1:maxGauss) 
    
    [priors, mius, covMatrices]=trainingGMM(dataTrain', numGauss );  
    BICVector(numGauss,1) =  BICscore(dataTrain(1:10000,:)',priors,mius,covMatrices)  
    AICVector(numGauss,1) =  AICscore(dataTrain(1:10000,:)',priors,mius,covMatrices) 
      
    
end

%% Plot
figure;
plot(1:30, BICVector(1:30,1));
title('BIC');
xlabel('Number of Gussians');
ylabel('Score');

figure;
plot(1:maxGauss, AICVector);
title('AIC score');

