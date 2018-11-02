function [ output, covEst, hi ] = gaussianMixtureRegression( input, means, ...
                              covar, inDim, outDim)

% This function carries out the Gaussian Mixture Regression from which it 
% is possible to obtain a serie of expected values for output (predictions)
% given a set of query points. The function develops the following steps:
%
% 1). Defines means and covariance matrices for P(x,y|j).
% 2). Computes the conditional expectation ŷ and variance of y given x, for
%     each gaussian component.
% 3). Computes responsibilities of each gaussian component of producing
%     given x.
% 4). Computes the conditional expectation ŷ and variance of y given x of
%     the entire mixture.
%
% The function gets as parameters:
% - input:  Query points (NxI)
% - means:  Means from GMM (KxZ)
% - covar:  Covariance matrices from GMM (ZxZxK)
% - inDim:  Vector indicating input dimensions (1xI)
% - outDim: Vector indicating output dimensions (1xO)
% 
% where
% - N: Number of query points
% - I: # Input variables
% - O: # Output variables
% - K: # Gaussian components
% - Z: I + O
                          
%% * * * Defining means and covariances with respect of inputs/outputs * * *
% When the probability P(x,y|j) is expressed as a normal pdf, it is 
% necessary to define:
% miu_j : [ miu_xj ; miu:yj ] 
% Cov_j : [ Cov_xxj Cov_xyj ; Cov_yxj Cov_yyj ] ;

% Means (miu)
miuInput    =   means( :, inDim ) ;
miuOutput   =   means( :, outDim ) ;

% Covariances (sigma)
covInput    =   covar( inDim, inDim, : ) ;
covOutput   =   covar( outDim, outDim, : ) ;
covInOut    =   covar( inDim, outDim, : ) ;
covOutIn    =   covar( outDim, inDim, : ) ;
                          

%% * * * Computing the conditional expectation and variance given input * * *                            
numPts      =   size( input, 1 ) ;      % Number of query points
numGauss    =   size( means, 1 ) ;      % Number of gaussians
numOutputs  =   size( outDim, 2 ) ;     % Number of output dimensions

condY       =   zeros( numPts, numOutputs, numGauss ) ;
% Conditional expectation ŷi for every query points 
for i = 1 : numGauss
    % Computing difference between each input point and input mean (miu_xj)
    diff        =   ( input - ones( numPts, 1 ) * miuInput( i, : ) )' ;
    % Computing conditional expectation ŷ for j-th gaussian
    condY(:,:,i)=   ( ones( numPts, 1 ) * miuOutput( i, : ) ) + ...
                    ( ( covOutIn( :, :, i ) / covInput( :, :, i ) ) * diff )';
end

condSigma   =   zeros( numOutputs, numOutputs, numGauss ) ;
% Conditional covariance sigma_j (estimated)
for i = 1 : numGauss
    condSigma( :, :, i )    =   covOutput( :, :, i ) - ...
        ( covOutIn( :, :, i ) / covInput( :, :, i ) ) * covInOut( :, :, i ) ;
end


%% * * * * Computing responsibilities of each Gaussian given input * * * *
% Conditional probability of x given j-th gaussian
pxi     =   zeros( numGauss, numPts ) ;
for i = 1 : numGauss
    pxi( i, : ) =   gaussianPDF( input, miuInput( i, : ), covInput( :, :, i ) ) ;
end

% Responsibilities for each gaussian
hi  =   zeros( numGauss, numPts ) ;
for i = 1 : numPts
    hi( :, i )  =   pxi( :, i ) ./ sum( pxi( :, i ) ) ;
end


%% * * * Computing conditional expectation and variance of the mixture * * *
% Conditional expectation ŷ of the resulting mixture given input
condYmixt   =   zeros( numPts, numOutputs, numGauss ) ;
for i = 1 : numGauss
    condYmixt( :, :, i )    =   condYmixt( :, :, i ) + ...
        ( ( hi( i, : )' * ones( 1, numOutputs ) ) .* condY( :, :, i ) ) ;
end
output  =   sum( condYmixt, 3 ) ;

% Conditional variance sigma of the resulting mixture given input
% "Sylvain's approach"
condSigmaMixt   =   zeros( numOutputs, numOutputs, numPts ) ;
for i = 1 : numPts
    for j = 1 : numGauss
        condSigmaMixt( :, :, i ) = condSigmaMixt( :, :, i ) + ...
            ( hi( j, i ) ^ 2 ) * condSigma( :, :, j ) ;
    end
end

covEst  =   condSigmaMixt ;

