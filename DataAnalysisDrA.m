load('matFiles/errorCalculations.mat', 'revErrDrATot')
load('matFiles/errorCalculations.mat', 'revErrDrATotNdx')
load('matFiles/errorCalculations.mat', 'revErrDrAFaceNdx')
load('matFiles/errorCalculations.mat', 'revErrDrANonFaceNdx')
load('matFiles/errorCalculations.mat', 'drATotErrNdx')
load('matFiles/errorCalculations.mat', 'drAFaceErrNdx')
load('matFiles/errorCalculations.mat', 'drANonFaceErrNdx')
errClasses = mapTopClass(drATotErrNdx(1:200));
errClasses = [errClasses mapTopClass(drAFaceErrNdx(1:200))];
errClasses = [errClasses mapTopClass(drANonFaceErrNdx(1:200))];
errClasses = [errClasses mapTopClass(revErrDrATotNdx(1:200))];
errClasses = [errClasses mapTopClass(revErrDrAFaceNdx(1:200))];
errClasses = [errClasses mapTopClass(revErrDrANonFaceNdx(1:200))];
csvwrite('dataAnalysis/errClassesDRA.csv',errClasses);

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
