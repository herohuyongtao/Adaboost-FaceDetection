haarCFvec = zeros(361,6885); %feature vec matrix. PreAllocated for speed when size is known
W = 20; H = 20; %dimensions of training images

% Three Rec FVec (Type C) %white, black, white horizontal 
count = 0;
for w = 1:floor(W/3) %w=1:6 => 3*w=3:18 
    for h = 1:H-1
        for x = 1: H-h %skip first rows 
            for y = 1:W-3*w %skip first columns 
                count = count+1;
                feat = zeros(H,W); %initialize to 0 
                feat(x:x+h-1,y:y+w-1)=1; %white 1
                feat(x:x+h-1,y+w:y+2*w-1)=-1; % center black
                feat(x:x+h-1,y+2*w:y+3*w-1)=1; % white 2
                feat(:,end) = [];
                feat(end,:) = [];
                haarCFvec(:,count) =feat(:); %vectorize feature 
            end
        end
    end
end
save fvecC.mat haarCFvec;
clearvars H W w h x y count feat;