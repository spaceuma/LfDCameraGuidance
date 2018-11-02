%% Diff Evaluation for GMM gesture detection
%% ModelTraining2gestures.m must be executed before

maxGauss = 20;
DiffVector = zeros(maxGauss, 2);
data = dataTrainLE;

for (numGauss = 1:maxGauss)
    numGauss    
    
    
    [priorsLE, miusLE, covMatricesLE]=trainingGMM(dataTrainLE, numGauss );  
    [priorsSC, miusSC, covMatricesSC]=trainingGMM(dataTrainSC, numGauss );
    
    %Para Lever effect
    pLE=gaussianMixture( dataTrainLE, priorsLE, miusLE, covMatricesLE );
    loglikeLE=sum(log(sum(pLE)));
    pSC=gaussianMixture( dataTrainLE, priorsSC, miusSC, covMatricesSC );    
    loglikeSC=sum(log(sum(pSC)));
    logprobLE=loglikeSC-loglikeLE;
    K=size(miusLE,3);
    N=size(dataTrainLE,2);
    D=size(dataTrainLE,1);
    p=zeros(N,K);
    DiffVector(numGauss,1)=logprobLE;
    
    %Para Surface contact
    pLE=gaussianMixture( dataTrainSC, priorsLE, miusLE, covMatricesLE );
    loglikeLE=sum(log(sum(pLE)));
    pSC=gaussianMixture( dataTrainSC, priorsSC, miusSC, covMatricesSC );    
    loglikeSC=sum(log(sum(pSC)));
    logprobSC=loglikeLE-loglikeSC;
    K=size(miusLE,3);
    N=size(dataTrainLE,2);
    D=size(dataTrainLE,1);
    p=zeros(N,K);
    DiffVector(numGauss,2)=logprobSC;
    
%     np=(K-1)+K*(D+0.5*D*(D+1));
% Seria interesante una funcion de la prob y la complejidad computacional
% del modelo, medida en tiempo de CPU, multiplicado por un factor, que es 
% probablemente lo que haga el Calinon y no lo explica bien...
% si existe un l�mite de CPU, �ste deber� ser fijado y elegido como n�
% m�ximo de Gaussianas que la CPU es capaz de procesar
% El �ndice podr�a ser �til para comparar diferentes m�todos y algoritmos
% ejemplo: diferentes algoritmos GMR o c�lculo de probabilidad
% Agrupaci�n de muestras en cada iteraci�n, para 10 muestras, 5 o menos
% podr�a proporcionar un �ndice que permita elegir n� de gaussianas para
% diferente n� de muestras (MUY INTERESANTE)
%     score=logprobLE + (np / 2) * log(N);
    DiffVector(numGauss)=logprobLE;
    
    
%     score=-loglike + (np / 2) * log(N);
    
    
end

%% Graphical representation
figure;
plot(1:18, DiffVector(1:18,:));
title('GMM Gesture Detection Score');
xlabel('Number of Gaussians N');
ylabel('Score');
legend('Lever effect','Surface contact');


