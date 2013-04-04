% Calcualte best error threshold per classifier - one pass
% 
% I load faceA and nonFaceA from haarVals.mat (master calculation .mat)
%
% create our BigAssMatrix(tm) of all images / features
% test = [faceA;nonFaceA];

% Index faces as 1 and non as 0
y = zeros(2429+4548,1);
y(1:2429) = 1;

% Create our probability of a single face - Uniform initially
D = ones(6977,1);
D = D./6977;

% Storage matrix of our values - each row is a feature
% Col 1 is minimum error value
% Col 2 is minimum error index
errorNdx = zeros(11016,2);

for i = 1:11016 % For every feature
    min = [1000,-1]; % Our temp var
    for j = 1:6977 % For every image
        foo = xor(test(:,i) < test(j,i),y)'*D;
        if foo < min(1)
            min = [foo,j];
        end
    end
    errorNdx(i,:) = min;
end

clearvars i j foo min