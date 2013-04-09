load 'matFiles/errorCalculations.mat' errSortNdx errNonFaceIndex errFaceIndex revErrTotNdx revErrFaceNdx revErrNonFaceNdx
errClasses = [errClasses mapTopClass(errSortNdx(1:200))];
errClasses = [errClasses mapTopClass(errFaceIndex(1:200))];
errClasses = [errClasses mapTopClass(errNonFaceIndex(1:200))];
errClasses = [errClasses mapTopClass(revErrTotNdx(1:200))];
errClasses = [errClasses mapTopClass(revErrFaceNdx(1:200))];
errClasses = [errClasses mapTopClass(revErrNonFaceNdx(1:200))];
csvwrite('dataAnalysis/errClassesVJ.csv',errClasses);

% Just read std out and copied to Excel Document
i=1;
sum(errClasses(1:10,i)=='A')
sum(errClasses(:,i)=='A')
sum(errClasses(1:10,i)=='B')
sum(errClasses(:,i)=='B')
sum(errClasses(1:10,i)=='C')
sum(errClasses(:,i)=='C')
sum(errClasses(1:10,i)=='D')
sum(errClasses(:,i)=='D')
i = 2;
sum(errClasses(1:10,i)=='A')
sum(errClasses(:,i)=='A')
sum(errClasses(1:10,i)=='B')
sum(errClasses(:,i)=='B')
sum(errClasses(1:10,i)=='C')
sum(errClasses(:,i)=='C')
sum(errClasses(1:10,i)=='D')
sum(errClasses(:,i)=='D')
i = 3;
sum(errClasses(1:10,i)=='A')
sum(errClasses(:,i)=='A')
sum(errClasses(1:10,i)=='B')
sum(errClasses(:,i)=='B')
sum(errClasses(1:10,i)=='C')
sum(errClasses(:,i)=='C')
sum(errClasses(1:10,i)=='D')
sum(errClasses(:,i)=='D')
i = 4;
sum(errClasses(1:10,i)=='A')
sum(errClasses(:,i)=='A')
sum(errClasses(1:10,i)=='B')
sum(errClasses(:,i)=='B')
sum(errClasses(1:10,i)=='C')
sum(errClasses(:,i)=='C')
sum(errClasses(1:10,i)=='D')
sum(errClasses(:,i)=='D')
i = 5;
sum(errClasses(1:10,i)=='A')
sum(errClasses(:,i)=='A')
sum(errClasses(1:10,i)=='B')
sum(errClasses(:,i)=='B')
sum(errClasses(1:10,i)=='C')
sum(errClasses(:,i)=='C')
sum(errClasses(1:10,i)=='D')
sum(errClasses(:,i)=='D')
i = 6;
sum(errClasses(1:10,i)=='A')
sum(errClasses(:,i)=='A')
sum(errClasses(1:10,i)=='B')
sum(errClasses(:,i)=='B')
sum(errClasses(1:10,i)=='C')
sum(errClasses(:,i)=='C')
sum(errClasses(1:10,i)=='D')
sum(errClasses(:,i)=='D')
