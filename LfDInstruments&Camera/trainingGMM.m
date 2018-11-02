function    [ priors, mius, covMatrices] = trainingGMM(Data, numGauss )

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% GMM/GMR framework for Haptic Guidance 
% Training function using the k-means
% Author: Carlos Perez del Pulgar
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


%% * * * * * * * * * * * Initializing GMM parameters * * * * * * * * * * *

numVar  = size( Data, 1 ) ;             % Number of variables (input/output)
oldLogLikel =   -realmax ;  % Old log likelihood


% Initializing emission probabilities (observation symbol probabilities B)
% Since each state is represented by a gaussian mixture, the initialization
% is based on k-means technique, finding good initial estimates for
% mixtures. This approach is more general than assuming just one gaussian
% for each HMM state.
% bj(k) = P( v_k at t | q_t = s_j )
[ priors, mius, covMatrices ]   =   trainingKmeans( Data', ( numGauss ) ) ;
                            
% Organizing mius and covariance matrices for each HMM state
% "numStates" matrices with "numGauss" gaussians of dimensionality "numVar"
mius    =   reshape( mius', [ numVar 1 numGauss ] ) ;

% "numStates" states with "numGauss" covariance matrices of 
% (numVar X numVar) dimensionality
covMatrices     =   reshape( covMatrices, [ numVar numVar 1 numGauss ] ) ;



function    [ priors, initMius, initCov ] = trainingKmeans( dataMatrix, numGauss )

% Each state is represented as a Gaussian mixture, thus k-means algorithm
% is carried out to obtaing good initial estimates for HMM emission
% probabilities

numVar      =   size( dataMatrix, 2 ) ;
numDataPts  =   size( dataMatrix, 1 ) ;

% Carrying out an unsupervised clustering technique for finding "good" 
% initial parameters values
[ indexes, centers ] =  kmeans( dataMatrix, numGauss ) ;

% Computing initial mean, prior and covariance matrix for gaussians 
% Initial mius will be the clusters' centers
initMius    =   centers;

% Covariance matrices and priors
initCov     =   zeros( numVar, numVar, numGauss ) ;
priors      =   zeros( numGauss, 1 ) ;
for i = 1 : numGauss
    % Searching for samples for cluster i
    indexCluster        =   find( indexes == i ) ;
    clusterData         =   dataMatrix( indexCluster, : ) ;
    % Covariance for cluster i
    initCov( :,:,i )    =   cov( clusterData ) + 1e-5 .* diag( ones( numVar, 1 ) ) ;
    % Prior for cluster i
    priors( i )         =   length( indexCluster ) / numDataPts ;
end
