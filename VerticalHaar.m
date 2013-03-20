fvec = []; %feature vec matrix. PreAllocate for speed when size is known
W = 19; H=19; %dimensions of training images

% Vertical (Type B) %whitebar, blackbar Vertical 
for w = 1:floor(W/2)-1 %w=1:8 => 2w=2:16 
    for h = 1:H-2 
        for x = 2: H-h %skip first rows 
            for y = 2:W-2*w %skip first columns 
                feat = zeros(H,W); %initialize to 0 
                feat(x:x+h-1,y:y+w-1)=1; %white bar 
                feat(x:x+h-1,y+w:y+2*w-1)=-1; %black bar 
                fvec=[fvec feat(:)']; %vectorize feature 
            end
        end
    end
end
%save fvec.mat fvec