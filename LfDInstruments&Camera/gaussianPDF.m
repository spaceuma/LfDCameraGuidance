function  p = gaussianPDF( dataPts, miu, covMatrix )

% This function allows to compute the Gaussian probability density function
% for a set of datapoints (dataPts), using the typical parameters of a
% normal distribution:
% 1. Mean: miu
% 2. Covariance matrix: covMatrix

% Computing constant term
d       =   size( covMatrix, 1 ) ;
% cte     =   (1 / sqrt( (( 2*pi ) ^ d ) * abs( det( covMatrix ) ) )) + realmin ;
% cte     =   (1 / sqrt( ( ( 2*pi ) ^ d )) * ( abs( det( covMatrix ) ) + realmin ) ) ;
cte     =   1 / sqrt( ( ( 2*pi ) ^ d ) * ( abs( det( covMatrix ) ) + realmin ) ) ;


% Computing the multivariate normal probability density function
numPts      =   size( dataPts, 1 ) ;
numData      =   size( dataPts, 2 ) ; %ADDED
difference  =   ( dataPts - ( ones( numPts, 1 ) * miu ) )';
mahalDist   =   diag( ( difference' / covMatrix ) * difference ) ;
p           =   cte * exp( -0.5 * mahalDist )' ;
