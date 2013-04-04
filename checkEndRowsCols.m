function [ missRow19 missCol19 ] = checkEndRowsCols( fvec )
%This class was used for testing the haar features to make sure they
%covered edge rows and columns

%initialized to missed
missCol19 = 0;
missRow19 = 0;

[rows cols] = size(fvec);
for ind = 1:cols
foo = fvec(:,ind);
n2 = length(foo);
n = sqrt(n2);
foo = reshape(foo,n,n);

%if there was a one or a negative one in the row or column, a haar feature
%used that column or row
if (max(foo(:,n)) == 1 || min(foo(:,n)) == -1)
    missCol19 = 1;
end
if (max(foo(n,:)) == 1 || min(foo(n,:)) == -1)
    missRow19 = 1;
end
    
end

end

