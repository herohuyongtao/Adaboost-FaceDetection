haarDFvec = zeros(361,5184); %feature vec matrix. 
% Preallocate for speed when size is known
W = 19; H=19; %dimensions of training images

% 4 Rec (Type D) Haar Feature 
% whitebar, blackbar 
% blackbar, whitebar
count = 0;
for w = 1:floor(W/2) % w=1:9 => 2*w=2:18   
    for h = 1:floor(H/2) %h=1:9 => 2h=2:18
        for x = 2:H-2*h %skip first cols 
            for y = 2:W-2*w %skip first columns 
                count = count + 1;
                feat = zeros(H,W); %initialize to 0 
                feat(x:x+h-1,y:y+w-1)=1; %white bar 1 
                feat(x:x+h-1,y+w:y+2*w-1)=-1; %black bar 1
                feat(x+h:x+2*h-1,y:y+w-1)=-1; %black bar 2
                feat(x+h:x+2*h-1,y+w:y+2*w-1)=1; %white bar 2
                haarDFvec(:,count) = feat(:); %vectorize feature 
            end
        end
    end
end
save fvecD.mat haarDFvec
clearvars H W h w x y feat count;