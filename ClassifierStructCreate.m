% Utility function to translate older version of threshold into structs

[numFvecs threshEntries] = size(threshold);
Classifier = struct;
for i = 1:numFvecs
    Classifier(i).polarity = threshold(i,1);
    Classifier(i).threshold = threshold(i,3);
    Classifier(i).haarFeatVec = allHaar(:,i);
end
