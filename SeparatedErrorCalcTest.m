% Proof of concept - Alsamman error calc

D = [1 2 3 4 4 3 2 1 1 2]';
h1 = [h(1:4); zeros(6,1)];
h0 = [zeros(4,1); h(5:end)];
[sortH, ndxH] = sort(h);
sortY = y(ndxH);
sortD = D(ndxH);
sD0 = zeros(10,1);
sD1 = zeros(10,1);
sD0(sortY==0) = sortD(sortY==0);
sD1(sortY==1) = sortD(sortY==1);
isD1 = cumsum(sD1);
isD0 = cumsum(sD0);
mxD1 = max(isD1) - isD1;
[minE1, ndxMinE1] = min(mxD1+isD0)
