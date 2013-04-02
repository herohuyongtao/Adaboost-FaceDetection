% Run for T= 1..10 test
D = ones(6977,1)./6977;
[~,w1] = ProcErrorOnePass(allHaarVals, faceClasses, D);
Warray = [w1];
newHaarVals = allHaarVals;
newD = D;
for i = 1:199
    foo = double(Warray(end).errorVec);
    foo(foo==1) = -1;
    foo(foo==0) = 1;
    newD = newD.*exp(-Warray(end).alpha * foo);
    newD = newD./sum(newD);
    newHaarVals(:,Warray(end).indexOfFeat) = [];
    [~,bar] = ProcErrorOnePass(newHaarVals, faceClasses, newD);
    Warray = [Warray bar];
end