h = [4 5 6 7 8 9 0 1 2 3];
y = [ones(4,1) ;zeros(6,1)];
h = h';
[sFeat ndx] = sort(h);
y = y(ndx);
D = [ones(10,1)]./10; D = D';
TN = sum(D(y==0));
TP = sum(D(y==1));
SN = zeros(10,1);
SP = zeros(10,1);
SN(y==0) = cumsum(D(y==0));
SP(y==1) = cumsum(D(y==1));
SP = fillVec(SP)
SN = fillVec(SN)
e1 = SP+(TN-SN);
e2 = SN+(TP-SP);
[e1Min, e1NDX] = min(e1);
[e2Min, e2NDX] = min(e2);
e1Min
e2Min
e1NDX
h(e1NDX)
h
sFeat
sFeat(4)
[sFeat iFeat]
[sFeat y]
sFeat(4)
