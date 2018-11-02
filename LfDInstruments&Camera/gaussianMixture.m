function    mixtures    =   gaussianMixture( dataPts, coeff, mius, covs )

% A gaussian mixture is a linear combination of gaussians used for
% generating very complex densities when just a gaussian can insufficient. 

numOfMix    =   size( coeff, 1 ) ;
numGauss    =   size( coeff, 2 ) ;
numDataPts  =   size( dataPts, 2 ) ;
mixtures    =   zeros( numDataPts, numOfMix ) ;

% Computing "numOfMix" superpositions of K gaussians densities of the form:
% p_i(x) = sum_j( C_j * N( x | miu_j, cov_j ) )
for i = 1 : numOfMix
    for j = 1 : numGauss
        mixtures( :, i ) = mixtures( :, i ) + ( coeff( i, j ) .* ...
            gaussianPDF( dataPts', mius( :, j, i )', covs( :, :, j, i ) ) )' ;
    end
end
