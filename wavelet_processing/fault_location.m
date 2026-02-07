function fault_distance = fault_location(indexA, indexB, indexC)
%--------------------------------------------------------------------------
% fault_location.m
%
% Machine Learning based fault location using wavelet energy indices
%
% Inputs:
%   indexA, indexB, indexC : Wavelet energy indices of three phases
%
% Output:
%   fault_distance         : Estimated fault distance (km)
%
% Author:
%   Dr. Ravi Kumar Goli
%--------------------------------------------------------------------------

%% ---------------- TRAINING DATA ----------------
% Features: [Index-A, Index-B, Index-C]
X = [ ...
    5281.993282  622.0799192 286.1387003;
    3994.960261  655.6560601 356.2311949;
    3222.661969  561.7559146 366.2851806;
    2666.573144  544.4363782 365.1305673;
    2271.831518  508.1222759 409.9753480;
    1984.438168  503.9818344 435.7375988;
    1896.034546  435.0786484 457.0244348;
    1673.210834  456.8436362 491.7558405;
    1486.657547  456.0164462 508.8525501;
    1369.601785  403.3431245 539.3902450;
    1266.071091  386.2025756 528.4425463];

% Target: Fault Distance (km)
Y = [20; 40; 60; 80; 100; 120; 140; 160; 180; 200; 220];

%% ---------------- DATA NORMALIZATION ----------------
[Xn, mu, sigma] = zscore(X);

%% ---------------- MODEL TRAINING ----------------
% Support Vector Regression
svrModel = fitrsvm(Xn, Y, ...
    'KernelFunction', 'rbf', ...
    'Standardize', false);

%% ---------------- FAULT LOCATION ESTIMATION ----------------
% Normalize test input
testX = ([indexA indexB indexC] - mu) ./ sigma;

% Predict fault distance
fault_distance = predict(svrModel, testX);

end
