function viewyalefaces()
%% This function will read some of Yale face images and display
%       Download and unzip the files which will create directories
%           yalefaces/trainingset/  - contains 135 images (from 15 people
%                                     with 9 different expressions)
%           yalefaces/testset/      - contains 10 images for testing
%       
%
%

close all;

Num_training_files = 135;                   
Num_test_files = 10;

trainpath = 'yalefaces/trainingset/';
testpath = 'yalefaces/testset/';
file = 's*';    
train_filenames = dir([trainpath file]);    % return a structure with filenames
test_filenames = dir([testpath file]);      % return a structure with filenames



% Read the first image in /trainingset/
filename = [trainpath train_filenames(1).name];   % filename in the list
I = imread(filename);

I1 = imresize(I,[100 100]);                 % resize it to 100x100
                                            % you can try different sizes
                                            % after cropping the images
[nRow,nCol] = size(I1);
figure; imshow(I1);
    


% Read 20 training images and display them as 2x10 tiles
nTileRow = 2;                               % for two persons
nTileCol = 9;                               % one person has 9 expressions
Y = zeros(nRow*nTileRow,nCol*nTileCol);     % to store whole images
k=1;
for i=1:nTileRow
    for j=1:nTileCol
        filename = [trainpath train_filenames(k).name];   % kth-filename in the list
        I = imread(filename);
        I1 = imresize(I,[100 100]);
        Y((i-1)*nRow+1:(i)*nRow, (j-1)*nCol+1:(j)*nCol) = I1;
        k = k+1;
    end
end

figure; imagesc(Y);
colormap(gray);axis image; axis off;
title('Training Images (2 persons with 9 expressions)');




% Read 10 test images and display them as 1x10 tiles
nTileRow = 1;
nTileCol = 10;                              % 10 test persons
Y = zeros(nRow*nTileRow,nCol*nTileCol);     % to store whole images
k=1;
for i=1:nTileRow
    for j=1:nTileCol
        filename = [testpath test_filenames(k).name];   % kth-filename in the list
        I = imread(filename);
        I1 = imresize(I,[100 100]);
        Y((i-1)*nRow+1:(i)*nRow, (j-1)*nCol+1:(j)*nCol) = I1;
        k = k+1;
    end
end

figure; imagesc(Y);
colormap(gray);axis image; axis off;
title('Test Images (10)');

