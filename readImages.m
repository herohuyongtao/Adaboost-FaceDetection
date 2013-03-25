% Loading files
% Appears that all training images have non-zero SD 
% Faces
H = 19; W = 19;
Path = 'train/face/';
fname = dir('train/face/*.pgm');
fnum = length(fname);
faceImgs = zeros(fnum,W*H);
faceCumImgs = zeros(fnum,W*H);
faceWhiteCumImgs = zeros(fnum,W*H);
zeroSD = [];
% For each file
for i = 1:fnum
    % Read the image in as a double
    im = im2double(imread([Path,fname(i).name]));
    faceCumImgs(i,:) = reshape(cumsum(cumsum(im,2)),1,361);
    imgMean = mean2(im);
    imgSD = std2(im);
    if imgSD < 0.001
        zeroSD = [zeroSD i];
    end
    
    im = imsubtract(im,imgMean);
    im = im./imgSD;
    faceWhiteCumImgs(i,:) = reshape(cumsum(cumsum(im,2)),1,361);
    faceImgs(i,:) = im(:)';
end

% Non-Faces
Path = 'train/non-face/';
fname = dir('train/non-face/*.pgm');
fnum = length(fname);
nonFaceImgs = zeros(fnum,W*H);
nonFaceCumImgs = zeros(fnum,W*H);
nonFaceWhiteCumImgs = zeros(fnum,W*H);
for i = 1:fnum
    im = im2double(imread([Path,fname(i).name]));
    nonFaceCumImgs(i,:) = reshape(cumsum(cumsum(im,2)),1,361);
    imgMean = mean2(im);
    imgSD = std2(im);
    if imgSD < 0.001
        zeroSD = [zeroSD i];
    end
    im = imsubtract(im,imgMean);
    im = im./imgSD;
    nonFaceWhiteCumImgs(i,:) = reshape(cumsum(cumsum(im,2)),1,361);
    nonFaceImgs(i,:) = im(:)';
end

save images.mat nonFaceCumImgs nonFaceImgs nonFaceWhiteCumImgs faceWhiteCumImgs faceImgs faceCumImgs;
clearvars Path H W fname fnum im i imgMean imgSD;