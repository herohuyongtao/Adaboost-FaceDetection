%Read images from test data set in seperated into faces and non faces

%default img size
H = 19; W = 19;
Path = 'test/face/';
fname = dir('test/face/*.pgm');
fnum = length(fname);
faceImgsTest = zeros(fnum,W*H);

% For each file
for i = 1:fnum
    % Read the image in as a double
    im = im2double(imread([Path,fname(i).name]));
    faceImgsTest(i,:) = im(:)';
end

Path = 'test/non-face/';
fname = dir('test/non-face/*.pgm');
fnum = length(fname);
nonFaceImgsTest = zeros(fnum,W*H);

% For each file
for i = 1:fnum
    % Read the image in as a double
    im = im2double(imread([Path,fname(i).name]));
    nonFaceImgsTest(i,:) = im(:)';
end

save testImages.mat nonFaceImgsTest faceImgsTest;
clearvars Path H W fname fnum im i;