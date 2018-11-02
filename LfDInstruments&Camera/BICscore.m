% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% GMM/GMR framework for Haptic Guidance 
% BIC Score function
% Author: Carlos Perez del Pulgar
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


function score =  BICscore(dataTrain,priors,mius,covMatrices)

K=size(mius,3);
N=size(dataTrain,2);
D=size(dataTrain,1);
p=zeros(N,K);

p=gaussianMixture( dataTrain, priors, mius, covMatrices );    
loglike=sum(log(sum(p)))

% np=(K-1)+K*(D+0.5*D*(D+1))
np=K*D;
score=loglike - (np / 2) * log(N);

