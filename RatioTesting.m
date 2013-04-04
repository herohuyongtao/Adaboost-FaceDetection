%take top 200 fvecs, scale them up to run across different scale images to
%test effect of scale on the error

scaleFaceResults = zeros(5,9,200);
scaleNonFaceResults = zeros(5,9,200);

%for 19x19 imgs and fvecs
ratioIteration = 1;
for n = 1:5
    face = faceImgs19(:,:,n);
    nonFace = nonFaceImgs19(:,:,n);
    for i = 1:200
        scaleFaceResults(n,ratioIteration,i) = fvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),face(:)');
        scaleNonFaceResults(n,ratioIteration,i) = fvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),nonFace(:)');
    end
end


%for 24x24 imgs and fvecs
ratioIteration = 2;
for n = 1:5
    face = faceImgs24(:,:,n);
    nonFace = nonFaceImgs24(:,:,n);
    for i = 1:200
        scaledHaarFvec = scaleFvecs(Classifier(1,errFaceIndex(i,1)).haarFeatVec,24);
        scaleFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),face(:)',scaledHaarFvec);
        scaleNonFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),nonFace(:)',scaledHaarFvec);
    end
end

%for 29x29 imgs and fvecs
ratioIteration = 3;
for n = 1:5
    face = faceImgs29(:,:,n);
    nonFace = nonFaceImgs29(:,:,n);
    for i = 1:200
        scaledHaarFvec = scaleFvecs(Classifier(1,errFaceIndex(i,1)).haarFeatVec,29);
        scaleFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),face(:)',scaledHaarFvec);
        scaleNonFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),nonFace(:)',scaledHaarFvec);
    end
end

%for 36x36 imgs and fvecs
ratioIteration = 4;
for n = 1:5
    face = faceImgs36(:,:,n);
    nonFace = nonFaceImgs36(:,:,n);
    for i = 1:200
        scaledHaarFvec = scaleFvecs(Classifier(1,errFaceIndex(i,1)).haarFeatVec,36);
        scaleFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),face(:)',scaledHaarFvec);
        scaleNonFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),nonFace(:)',scaledHaarFvec);
    end
end

%for 45x45 imgs and fvecs
ratioIteration = 5;
for n = 1:5
    face = faceImgs45(:,:,n);
    nonFace = nonFaceImgs45(:,:,n);
    for i = 1:200
        scaledHaarFvec = scaleFvecs(Classifier(1,errFaceIndex(i,1)).haarFeatVec,45);
        scaleFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),face(:)',scaledHaarFvec);
        scaleNonFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),nonFace(:)',scaledHaarFvec);
    end
end

%for 56x56 imgs and fvecs
ratioIteration = 6;
for n = 1:5
    face = faceImgs56(:,:,n);
    nonFace = nonFaceImgs56(:,:,n);
    for i = 1:200
        scaledHaarFvec = scaleFvecs(Classifier(1,errFaceIndex(i,1)).haarFeatVec,56);
        scaleFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),face(:)',scaledHaarFvec);
        scaleNonFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),nonFace(:)',scaledHaarFvec);
    end
end

%for 70x70 imgs and fvecs
ratioIteration = 7;
for n = 1:5
    face = faceImgs70(:,:,n);
    nonFace = nonFaceImgs70(:,:,n);
    for i = 1:200
        scaledHaarFvec = scaleFvecs(Classifier(1,errFaceIndex(i,1)).haarFeatVec,70);
        scaleFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),face(:)',scaledHaarFvec);
        scaleNonFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),nonFace(:)',scaledHaarFvec);
    end
end

%for 88x88 imgs and fvecs
ratioIteration = 8;
for n = 1:5
    face = faceImgs88(:,:,n);
    nonFace = nonFaceImgs88(:,:,n);
    for i = 1:200
        scaledHaarFvec = scaleFvecs(Classifier(1,errFaceIndex(i,1)).haarFeatVec,88);
        scaleFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),face(:)',scaledHaarFvec);
        scaleNonFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),nonFace(:)',scaledHaarFvec);
    end
end

%for 110x110 imgs and fvecs
ratioIteration = 9;
for n = 1:5
    face = faceImgs110(:,:,n);
    nonFace = nonFaceImgs110(:,:,n);
    for i = 1:200
        scaledHaarFvec = scaleFvecs(Classifier(1,errFaceIndex(i,1)).haarFeatVec,110);
        scaleFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),face(:)',scaledHaarFvec);
        scaleNonFaceResults(n,ratioIteration,i) = scaleFvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),nonFace(:)',scaledHaarFvec);
    end
end