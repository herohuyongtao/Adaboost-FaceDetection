haarAFvec = zeros(361,11016); %feature vec matrix. 
 %Preallocate for speed when size is known
W = 19; H=19; %dimensions of training images

% Horizontal (Type A) %whitebar, blackbar horizontal 
count = 0;
for w = 1:floor(W/2) %w=1:8 => 2w=2:16 
    for h = 1:H-2 
        for x = 2: H-h %skip first rows 
            for y = 2:W-2*w %skip first columns 
                count = count + 1;
                feat = zeros(H,W); %initialize to 0 
                feat(x:x+h-1,y:y+w-1)=1; %white bar 
                feat(x:x+h-1,y+w:y+2*w-1)=-1; %black bar 
                haarAFvec(:,count) = feat(:); %vectorize feature 
            end
        end
    end
end
save fvecA.mat haarAFvec
clearvars H W w h x y feat count;