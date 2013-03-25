function foo = showFeature( fvec, index)
%showFeature Utility function to show a feature
%   Pass in the big feature vector and an index
%   This will resize the index'd fvec and show it
%   nxn img

foo = fvec(:,index);
n2 = length(foo);
n = sqrt(n2);
foo = reshape(foo,n,n);
imagesc(foo)


end

