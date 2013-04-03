function [ outFvecScaled ] = scaleFvecs( inputFvec, n )
%Function takes in a vectorized haar feature and scales it to n by n size
%and returns it revectorized

%prepopulate
outFvecScaled = zeros(n*n,1);
%original W H = 19x19
squareFvec = reshape(inputFvec,19,19);
%scale up to n by n
scaledFvec = imresize(squareFvec, [n n], 'nearest');
%vectorize
outFvecScaled = reshape(scaledFvec,n*n,1);

end

