vertFvec = []; %feature vec matrix. PreAllocate for speed when size is known
W = 19; H=19; %dimensions of training images

% Vertical (Type B) %whitebar, blackbar Vertical 
for w = 1:W-2  
    for h = 1:floor(H/2)-1 %h=1:8 => 2h=2:16
        for x = 2:H-2*h %skip first cols 
            for y = 2:W-w %skip first columns 
                feat = zeros(H,W); %initialize to 0 
                feat(x:x+h-1,y:y+w-1)=1; %white bar 
                feat(x+h:x+2*h-1,y:y+w-1)=-1; %black bar 
                vertFvec=[vertFvec feat(:)]; %vectorize feature 
            end
        end
    end
end
save fvecVert.mat vertFvec