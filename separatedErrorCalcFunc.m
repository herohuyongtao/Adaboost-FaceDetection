function [threshold] = separatedErrorCalcFunc( haarInput, ...
                faceClasses, D)
% Presumes haarValsA 6977 x 11016
% images x features where h(i,j) is the fVal of image i and feat j
% faceClasses = 6977x1 array where 1- face 0-non face
[~,N] = size(haarInput);
% polarity, errMin, sFeat, faceErr, nonFaceErr
threshold = zeros(N,4); 
for i = 1:N
    [sFeat, ndx] = sort(haarInput(:,i));
    % Y is the sorted face/notface vec
    y = faceClasses(ndx);
    sortD = D(ndx);
    % D = [ones(6977,1)]./6977;
    h1 = zeros(N,1);
    h0 = zeros(N,1);
    sD0 = zeros(N,1);
    sD1 = zeros(N,1);
    h1(y==1) = sFeat(y==1);
    h0(y==0) = sFeat(y==0);
    sD0(y==0) = sortD(y==0);
    sD1(y==1) = sortD(y==1);
    isD1 = cumsum(sD1);
    isD0 = cumsum(sD0);
    mxD1 = max(isD1) - isD1;
    [minE1,ndxMinE1] = min(mxD1+isD0);
    threshold(i,1) = 0;
    threshold(i,2) = minE1;
    threshold(i,3) = sFeat(ndxMinE1);
    threshold(i,4) = mxD1(ndxMinE1);
    threshold(i,5) = isD0(ndxMinE1);
end

clearvars y D TN TP SN SP e1 e2 e1Min e2Min e1NDX e2NDX i;