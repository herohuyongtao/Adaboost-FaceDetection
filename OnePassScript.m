% Presumes haarValsA 6977 x 11016
% images x features where h(i,j) is the fVal of image i and feat j
% faceClasses = 6977x1 array where 1- face 0-non face
% Script Ver
[~,N] = size(allHaarVals);
D = [ones(6977,1)]./6977;
threshold = zeros(N,5);
weakLearner = struct;
equalThresh = [];
for i = 1:N
    [sFeat, ndx] = sort(allHaarVals(:,i));
    % y is the polarity of the sorted fVals
    y = faceClasses(ndx);
    % D = [ones(6977,1)]./6977;
    TN = sum(D(y==0));
    TP = sum(D(y==1));
    SN = zeros(6977,1);
    SP = zeros(6977,1);
    SN(y==0) = cumsum(D(y==0));
    SP(y==1) = cumsum(D(y==1));
    SP = fillVec(SP);
    SN = fillVec(SN);
    e1 = SP+(TN-SN);
    e2 = SN+(TP-SP);
    [e1Min, e1NDX] = min(e1);
    [e2Min, e2NDX] = min(e2);
    if e1Min < e2Min
        threshold(i,1) = 0;
        threshold(i,2) = e1Min;
        threshold(i,3) = sFeat(e1NDX);
    elseif e2Min < e1Min
        threshold(i,1) = 1;
        threshold(i,2) = e2Min;
        threshold(i,3) = sFeat(e2NDX);
    else
        threshold(i,1) = 1;
        threshold(i,2) = e2Min;
        threshold(i,3) = sFeat(e2NDX);
        equalThresh = [equalThresh i];
    end
    if threshold(i,1) == 0
        threshold(i,4) = sum(xor(y(y==1),(sFeat(y==1) > threshold(i,2))));
        threshold(i,5) = sum(xor(y(y==0),(sFeat(y==0) > threshold(i,2))));
    else
        threshold(i,4) = sum(xor(y(y==1),(sFeat(y==1) < threshold(i,2))));
        threshold(i,5) = sum(xor(y(y==0),(sFeat(y==0) < threshold(i,2))));
    end   

end
threshold(:,4) = threshold(:,4)./2429;
threshold(:,5) = threshold(:,5)./4548;
[weakLearner.error, weakLearner.indexOfFeat] = min(threshold(:,2));
% If polarity = 0 - everything less than thresh is a non-face
% else everything less than thresh is a face
weakLearner.polarity = threshold(weakLearner.indexOfFeat,1);
weakLearner.thresh = threshold(weakLearner.indexOfFeat,3);
weakLearner.fVal = allHaarVals(:,weakLearner.indexOfFeat);
if weakLearner.polarity == 0
    weakLearner.errorVec = xor(faceClasses, ...
        (weakLearner.fVal > weakLearner.thresh));
elseif weakLearner.polarity == 1
    weakLearner.errorVec = xor(faceClasses, ...
        (weakLearner.fVal < weakLearner.thresh));
else
    error('Polarity != 1|0')
end
weakLearner.faceError = sum(weakLearner.errorVec(faceClasses==1))/length(faceClasses);
weakLearner.nonFaceError = sum(weakLearner.errorVec(faceClasses==0))/length(faceClasses);
weakLearner.alpha = .5*log((1-weakLearner.error)/weakLearner.error);
clearvars y D TN TP SN SP e1 e2 e1Min e2Min e1NDX e2NDX i;
