% Loading files
% Faces
H = 19; W = 19;
Path = 'train/face/';
fname = dir('train/face/*.pgm');
fnum = length(files);
Imgs = zeros(fnum,W*H);
zeroSD = [];
for i = 1:fnum
    im = im2double(imread([Path,fname(i).name]));
    imgMean = mean(mean(im));
    imgSD = std(std(im));
    if imgSD < 0.001
        zeroSD = [zeroSD i];
    end
    im = imsubtract(im,imgMean);
    im = im./imgSD;
    Imgs(i,:) = im(:)';
end

% Non-Faces
Path = 'train/non-face/';
fname = dir('train/non-face/*.pgm');
fnum = length(files);
nonFaceImgs = zeros(fnum,W*H);
for i = 1:fnum
    im = im2double(imread([Path,fname(i).name]));
    imgMean = mean(mean(im));
    imgSD = std(std(im));
    if imgSD < 0.001
        zeroSD = [zeroSD i];
    end
    im = imsubtract(im,imgMean);
    im = im./imgSD;
    nonFaceImgs(i,:) = im(:)';
end

clearvars Path H W fname fnum im i imgMean imgSD