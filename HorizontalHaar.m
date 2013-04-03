haarAFvec = zeros(361,17100); %feature vec matrix. 
%Preallocate for speed when size is known
W = 20; H=20; %dimensions of training images

% Horizontal (Type A) %whitebar, blackbar horizontal 
count = 0;
for w = 1:floor(W/2) %w=1:9 => 2w=2:18 
    for h = 1:H-1 %h=1:18 changed from h-2
        for x = 1: H-h %original started at 2 skip first rows 
            for y = 1:W-2*w %originaly started at 2 skip first columns 
                count = count + 1;
                feat = zeros(H,W); %initialize to 0 
                feat(x:x+h-1,y:y+w-1)=1; %white bar 
                feat(x:x+h-1,y+w:y+2*w-1)=-1; %black bar 
                 feat(:,end) = [];
                 feat(end,:) = [];
                haarAFvec(:,count) = feat(:); %vectorize feature 
            end
        end
    end
end
save fvecA.mat haarAFvec
clearvars H W w h x y feat count;