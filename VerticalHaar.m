% This script creates all of the B class Haar features
% Vertical Bar 
%
%   Sum of [-1's] and [1's]
%   ____________
%   | -1 -1 -1 |
%   | -1 -1 -1 |
%   | -1 -1 -1 |
%   |  1  1  1 |
%   |  1  1  1 |
%   |  1  1  1 |
%   """"""""""""
%


haarBFvec = zeros(361,17100); % feature vec matrix. 
% Preallocate for speed when size is known
% clearvars H W h w x y count feat haarBFvec;
W = 20; H = 20; % dimensions of training images + 1 r/c padding

% Vertical (Type B) %whitebar, blackbar Vertical 
count = 0;
for w = 1:W-1 % w=1:18 | originaly W-2
    for h = 1:floor(H/2) % h=1:9 => 2h=2:18 | original floor(H/2)-1
        for x = 1:H-2*h % skip first rows 
            for y = 1:W-w % skip first columns 
                count = count + 1;
                feat = zeros(H,W); % initialize to 0 
                feat(x:x+h-1,y:y+w-1)=-1; % black bar
                feat(x+h:x+2*h-1,y:y+w-1)=1; % white bar
                feat(:,end) = []; % Delete the padding
                feat(end,:) = [];
                haarBFvec(:,count) =feat(:); % vectorize feature 
            end
        end
    end
end

save fvecB.mat haarBFvec;
clearvars H W h w x y count feat;
