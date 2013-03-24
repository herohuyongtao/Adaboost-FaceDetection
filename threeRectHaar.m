CFvec = zeros(361,6885); %feature vec matrix. PreAllocated for speed when size is known
W = 19; H=19; %dimensions of training images

% Three Rec FVec (Type C) %white, black, white horizontal 
for w = 1:floor(W/3) %w=1:3 => 3*w=3:9 
    for h = 1:H-2 
        for x = 2: H-h %skip first rows 
            for y = 2:W-3*w %skip first columns 
                feat = zeros(H,W); %initialize to 0 
                feat(x:x+h-1,y:y+w-1)=1; %white 1
                feat(x:x+h-1,y+w:y+2*w-1)=-1; % center black
                feat(x:x+h-1,y+2*w:y+3*w-1)=1; % white 2
                CFvec=[CFvec feat(:)]; %vectorize feature 
            end
        end
    end
end
save fvecC.mat CFvec
%clearvars H W h x y