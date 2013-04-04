load fvecA;
load fvecB; 
load fvecC; 
load fvecD; 
load images faceImgs nonFaceImgs;
load testImages faceImgsTest nonFaceImgsTest;
%create feature vector of all haar values
allHaar = [haarAFvec haarBFvec haarCFvec haarDFvec];
clear haar*;
%concat all training images
allImgs = [faceImgs;nonFaceImgs];
clear faceImgs nonFaceImgs;
%concat all test images 472 faces 23573 nonfaces
allTestImgs = [faceImgsTest;nonFaceImgsTest];
clear faceImgsTest nonFaceImgsTest;
%training images * haar vectors
allHaarVals = allImgs * allHaar;
clear allImgs;
%test images
allHaarValsTest = allTestImgs * allHaar;
faceClasses = [ones(2429,1); zeros(4548,1)];
testFaceClasses = [ones(472,1); zeros(23573,1)];
D = ones(6977,1)./6977;