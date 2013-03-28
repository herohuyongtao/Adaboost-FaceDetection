%run fvecs across all faces and non faces
% faceA = faceImgs * haarAFvec; 
% faceB = faceImgs * haarBFvec;
% faceC = faceImgs * haarCFvec;
% faceD = faceImgs * haarDFvec;
% nonFaceA = nonFaceImgs * haarAFvec;
% nonFaceB = nonFaceImgs * haarBFvec;
% nonFaceC = nonFaceImgs * haarCFvec;
% nonFaceD = nonFaceImgs * haarDFvec;

H=19; W=19;

[fRow fCol] = size(faceImgs);
[nfRow nfCol] = size(nonFaceImgs);

% allImgsA = zeros(fRow+nfRow,1);
% allImgsA(1:fRow) = 1;
% allImgsB = allImgsA;
% allImgsC = allImgsA;
% allImgsD = allImgsA;

%faceTest = faceA(1:4,:);
%nonFaceTest = nonFaceA(1:6,:);
%test = [faceTest ; nonFaceTest];

numberOFfvecsTested = 3000; 
test = [faceA ; nonFaceA];

a = size(test);
sz = a(1);
y = zeros(sz,numberOFfvecsTested);
stdProbability = ones(sz,1);
stdProbability = stdProbability./(sz);

tMinus = nfRow/sz;
tPlus = fRow/sz;
sMinus = zeros(sz,numberOFfvecsTested);
sPlus = zeros(sz,numberOFfvecsTested);

for numFvecs = 1:numberOFfvecsTested
    [h origIndex] = sort(test(:,numFvecs),'ascend');
    
    for i = 1:sz
        if origIndex(i) <= fRow
            y(i,numFvecs) = 1;
        end
    end
    
    sMinus(1,numFvecs) = tMinus;
    sPlus(1,numFvecs) = tPlus;
    
    for i = 1:(sz-1)
        if y(i,numFvecs) == 1
            sPlus((i+1),numFvecs) = sPlus(i,numFvecs) - stdProbability(i);
            sMinus((i+1),numFvecs) = sMinus(i,numFvecs);
        else
            sPlus((i+1),numFvecs) = sPlus(i,numFvecs);
            sMinus((i+1),numFvecs) = sMinus(i,numFvecs) - stdProbability(i);
        end
    end
end
        
    