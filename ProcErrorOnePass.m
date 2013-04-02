function [threshold, weakLearner] = ProcErrorOnePass( haarInput, ...
                faceClasses, D)
% Presumes haarValsA 6977 x 11016
% images x features where h(i,j) is the fVal of image i and feat j
% faceClasses = 6977x1 array where 1- face 0-non face
[~,N] = size(haarInput);
threshold = zeros(N,3);
weakLearner = struct;
equalThresh = [];
for i = 1:N
    [sFeat, ndx] = sort(haarInput(:,i));
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
%         threshold(i).polarity = 0;
%         threshold(i).error = e1Min;
%         threshold(i).value = sFeat(e1NDX);
    elseif e2Min < e1Min
        threshold(i,1) = 1;
        threshold(i,2) = e2Min;
        threshold(i,3) = sFeat(e2NDX);
%         threshold(i).polarity = 1;
%         threshold(i).error = e2Min;
%         threshold(i).value = sFeat(e2NDX);
    else
        threshold(i,1) = 1;
        threshold(i,2) = e2Min;
        threshold(i,3) = sFeat(e2NDX);
%         threshold(i).polarity = 1;
%         threshold(i).error = e2Min;
%         threshold(i).value = sFeat(e2NDX);
        equalThresh = [equalThresh i];
    end
end

[weakLearner.error, weakLearner.indexOfFeat] = min(threshold(:,2));
% If polarity = 0 - everything less than thresh is a non-face
% else everything less than thresh is a face
weakLearner.polarity = threshold(weakLearner.indexOfFeat,1);
weakLearner.thresh = threshold(weakLearner.indexOfFeat,3);
weakLearner.fVal = haarInput(:,weakLearner.indexOfFeat);
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