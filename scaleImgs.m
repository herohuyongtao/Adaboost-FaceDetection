Path = 'facePics/';
fname = dir('facePics/*.jpg');
fnum = length(fname);
faceImgs19 = zeros(19,19,5);
faceImgs24 = zeros(24,24,5);
faceImgs29 = zeros(29,29,5);
faceImgs36 = zeros(36,36,5);
faceImgs45 = zeros(45,45,5);
faceImgs56 = zeros(56,56,5);
faceImgs70 = zeros(70,70,5);
faceImgs88 = zeros(88,88,5);
faceImgs110 = zeros(110,110,5);
for i = 1:5
    im = rgb2gray(imread([Path,fname(i).name]));
    faceImgs19(:,:,i) = imresize(im, [19 19], 'nearest');
    faceImgs24(:,:,i) = imresize(im, [24 24], 'nearest');
    faceImgs29(:,:,i) = imresize(im, [29 29], 'nearest');
    faceImgs36(:,:,i) = imresize(im, [36 36], 'nearest');
    faceImgs45(:,:,i) = imresize(im, [45 45], 'nearest');
    faceImgs56(:,:,i) = imresize(im, [56 56], 'nearest');
    faceImgs70(:,:,i) = imresize(im, [70 70], 'nearest');
    faceImgs88(:,:,i) = imresize(im, [88 88], 'nearest');
    faceImgs110(:,:,i) = imresize(im, [110 110], 'nearest');
end

Path = 'randomPics/';
fname = dir('randomPics/*.jpg');
fnum = length(fname);

nonFaceImgs19 = zeros(19,19,5);
nonFaceImgs24 = zeros(24,24,5);
nonFaceImgs29 = zeros(29,29,5);
nonFaceImgs36 = zeros(36,36,5);
nonFaceImgs45 = zeros(45,45,5);
nonFaceImgs56 = zeros(56,56,5);
nonFaceImgs70 = zeros(70,70,5);
nonFaceImgs88 = zeros(88,88,5);
nonFaceImgs110 = zeros(110,110,5);

for i = 1:5
    im = rgb2gray(imread([Path,fname(i).name]));
    nonFaceImgs19(:,:,i) = imresize(im, [19 19], 'nearest');
    nonFaceImgs24(:,:,i) = imresize(im, [24 24], 'nearest');
    nonFaceImgs29(:,:,i) = imresize(im, [29 29], 'nearest');
    nonFaceImgs36(:,:,i) = imresize(im, [36 36], 'nearest');
    nonFaceImgs45(:,:,i) = imresize(im, [45 45], 'nearest');
    nonFaceImgs56(:,:,i) = imresize(im, [56 56], 'nearest');
    nonFaceImgs70(:,:,i) = imresize(im, [70 70], 'nearest');
    nonFaceImgs88(:,:,i) = imresize(im, [88 88], 'nearest');
    nonFaceImgs110(:,:,i) = imresize(im, [110 110], 'nearest');
end