%run fvecs across all faces and non faces
faceA = faceImgs * haarAFvec; 
faceB = faceImgs * haarBFvec;
faceC = faceImgs * haarCFvec;
faceD = faceImgs * haarDFvec;
nonFaceA = nonFaceImgs * haarAFvec;
nonFaceB = nonFaceImgs * haarBFvec;
nonFaceC = nonFaceImgs * haarCFvec;
nonFaceD = nonFaceImgs * haarDFvec;

[fRow fCol] = size(faceImgs);
[nfRow nfCol] = size(nonFaceImgs);

allImgsA = zeros(fRow+nfRow,1);
allImgsA(1:fRow) = 1;
allImgsB = allImgsA;
allImgsC = allImgsA;
allImgsD = allImgsA;

stdProbability = ones(fRow+nfRow,1);
stdProbability = stdProbability./(fRow+nfRow);

test = [faceA ; nonFaceA];
