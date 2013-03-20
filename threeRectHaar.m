threeRecFvec = []; %feature vec matrix. PreAllocate for speed when size is known
W = 19; H=19; %dimensions of training images

% Horizontal (Type A) %whitebar, blackbar horizontal 
for w = 1:floor(W/3) %w=1:6 => 2*w=2:12 
    for h = 1:H-2 
        for x = 2: H-h %skip first rows 
            for y = 2:W-2*w %skip first columns 
                feat = zeros(H,W); %initialize to 0 
                feat(x:x+h-1,y:y+w-1)=1; %white bar 
                feat(x:x+h-1,y+w:y+2*w-1)=-1; %black bar 
                threeRecFvec=[threeRecFvec feat(:)]; %vectorize feature 
            end
        end
    end
end
%save fvecHoriz.mat threeRecFvec
%clearvars H W h x y