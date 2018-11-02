% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% GMM/GMR framework for Haptic Guidance 
% AIC Score function
% Author: Carlos Perez del Pulgar
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


function score =  AICscore(dataTrain,priors,mius,covMatrices)

K=size(mius,3);
N=size(dataTrain,2);
D=size(dataTrain,1);
p=zeros(N,K);

p=gaussianMixture( dataTrain, priors, mius, covMatrices );    
loglike=sum(log(sum(p)))

np=K*D;
score=-loglike + (np / 2);

