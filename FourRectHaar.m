% This script creates all of the D class Haar features
% Four Rectangle Haar 
%
%   Sum of [-1's] and [1's]
%   _____________
%   |  1  1 -1 -1|
%   |  1  1 -1 -1|
%   | -1 -1  1  1|
%   | -1 -1  1  1|
%   """""""""""""

haarDFvec = zeros(361,5184); % feature vec matrix. 
% Preallocate for speed when size is known
W = 20; H = 20; % dimensions of training images + 1 r/c padding

count = 0;
for w = 1:floor(W/2) % w=1:9 => 2*w=2:18   
    for h = 1:floor(H/2) % h=1:9 => 2h=2:18
        for x = 1:H-2*h % skip first cols 
            for y = 1:W-2*w % skip first columns 
                count = count + 1;
                feat = zeros(H,W); % initialize to 0 
                feat(x:x+h-1,y:y+w-1)=1; % white bar 1 
                feat(x:x+h-1,y+w:y+2*w-1)=-1; % black bar 1
                feat(x+h:x+2*h-1,y:y+w-1)=-1; % black bar 2
                feat(x+h:x+2*h-1,y+w:y+2*w-1)=1; % white bar 2
                feat(end,:) = []; % Delete padding
                feat(:,end) = [];
                haarDFvec(:,count) = feat(:); %vectorize feature 
            end
        end
    end
end
save fvecD.mat haarDFvec;
clearvars H W h w x y feat count;
