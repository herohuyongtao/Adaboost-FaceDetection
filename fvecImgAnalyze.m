function [ pass ] = fvecImgAnalyze( ClassifierStruct, vctrzdImg )
%fvecImgAnalyze takes in a struct that contains a harr feature, the
%polarity, and threshold associated with it. This is then applied to the
%image to see if it passes or fails as a face

result = vctrzdImg * ClassifierStruct.haarFeatVec;
pass = 0; %defaults to not a face

%if polarity is 0, then everything below this is a face
if ClassifierStruct.polarity == 0 && result > ClassifierStruct.threshold
    pass = 1;
%if polarity is 1, then everything above this is a face
elseif ClassifierStruct.polarity == 1 && ClassifierStruct.threshold > result
    pass = 1;
end

end

