function [ cameraPos ] = getEstimatedCameraPos( leftInstrument, rightInstrument, mu, sigma, input, output )
% This function returns the estimated position of the camera based on the
% obtained GMM parameters mu and sigma
%   leftInstrument : [X,Y] Position X,Y of the left instrument
%   rightInstrument : [X,Y] Position X,Y of the right instrument
%   mu : means matrix : [NumGauss x length]
%   sigma : covariances matrix : [length x legnth x NumGauss]
%   input : input elements on mu and sigma
%   output : output elements on mu and sigma
    
    [ cameraPos, ySigma ] = gaussianMixtureRegression( [leftInstrument rightInstrument], mu, sigma, input, output ) ;

end

