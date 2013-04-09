function [ classVec ] = mapTopClass( haarNdxVec )
%mapTopClass Map the indicies of a Haar Index to each class
%   Takes a vector of Haar Indices and tacks on a vector of classes 
classVec = char(zeros(size(haarNdxVec)));
A = haarNdxVec <= 17100;
B = (haarNdxVec > 17100) & (haarNdxVec <= 34200);
C = (haarNdxVec > 34200) & (haarNdxVec <= 45030);
D = (haarNdxVec > 45030);
classVec(A==1) = 'A';
classVec(B==1) = 'B';
classVec(C==1) = 'C';
classVec(D==1) = 'D';
end