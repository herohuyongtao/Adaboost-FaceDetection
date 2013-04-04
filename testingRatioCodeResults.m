filename = 'scaleStatsRatioFaces.csv';

%csvwrite(filename,M,row,col)
%this shows the percent a ratio of features was correct across all the face
%images
errorForEachScaleFaces = zeros(9,1);
for i = 1:9
    for pic = 1:5
        errorForEachScaleFaces(i,1) = errorForEachScaleFaces(i,1) + sum(scaleFaceResults(pic,i,:));
    end
    errorForEachScaleFaces(i,1) = errorForEachScaleFaces(i,1)/1000;
end

csvwrite(filename,errorForEachScaleFaces(:),1,1);

%this shows the percent a ratio of features was correct across all the non
%face images
filename = 'scaleStatsRatioNonFaces.csv';
errorForEachScaleNonFaces = zeros(9,1);
for i = 1:9
    for pic = 1:5
        errorForEachScaleNonFaces(i,1) = errorForEachScaleNonFaces(i,1) + sum(scaleNonFaceResults(pic,i,:));
    end
    errorForEachScaleNonFaces(i,1) = errorForEachScaleNonFaces(i,1)/1000;
end

csvwrite(filename,errorForEachScaleNonFaces(:),1,1);


%this shows percent time for each haar feature includig all scales misclassified a non
%face
filename = 'scaleStatsFvecNonFaces.csv';
errorForEachFvecNonFaces = zeros(200,1);
for haarFeat = 1:200
    for i = 1:9
        errorForEachFvecNonFaces(haarFeat,1) = errorForEachFvecNonFaces(haarFeat,1) + sum(scaleNonFaceResults(:,i,haarFeat));
    end
    errorForEachFvecNonFaces(haarFeat,1) = errorForEachFvecNonFaces(haarFeat,1)/45;
end

csvwrite(filename,errorForEachFvecNonFaces(:),1,1);


%this shows percent time for each haar feature includig all scales detected a
%face
filename = 'scaleStatsFvecFaces.csv';
errorForEachFvecFaces = zeros(200,1);
for haarFeat = 1:200
    for i = 1:9
        errorForEachFvecFaces(haarFeat,1) = errorForEachFvecFaces(haarFeat,1) + sum(scaleFaceResults(:,i,haarFeat));
    end
    errorForEachFvecFaces(haarFeat,1) = errorForEachFvecFaces(haarFeat,1)/45;
end

csvwrite(filename,errorForEachFvecFaces(:),1,1);
