testResults = zeros(24045,200);
for n = 1:24045
    for i = 1:200
        testResults(n,i) = fvecImgAnalyze(Classifier(1,errFaceIndex(i,1)),allTestImgs(n,:));
    end
end