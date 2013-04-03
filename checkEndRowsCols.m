function [ missRow19 missCol19 ] = checkEndRowsCols( fvec )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

missCol19 = 0;
missRow19 = 0;

[rows cols] = size(fvec);
for ind = 1:cols
foo = fvec(:,ind);
n2 = length(foo);
n = sqrt(n2);
foo = reshape(foo,n,n);
if (max(foo(:,n)) == 1 || min(foo(:,n)) == -1)
    missCol19 = 1;
end
if (max(foo(n,:)) == 1 || min(foo(n,:)) == -1)
    missRow19 = 1;
end
    
end

end

