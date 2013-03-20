function showFeature( fvec, index )
%showFeature Utility function to show a feature
%   Pass in the big feature vector and an index
%   This will resize the index'd fvec and show it

foo = fvec(:,index);
foo = reshape(foo,19,19);
imagesc(foo)


end

