function [Ytr, Yte] = readyalefaces(Num_training_files,Num_test_files)
%% Returns face images in a single matrix

trainpath = 'yalefaces/trainingset/';
testpath = 'yalefaces/testset/';
file = 's*';    
train_filenames = dir([trainpath file]);    % return a structure with filenames
test_filenames = dir([testpath file]);      % return a structure with filenames

% read faces
Ytr = zeros(10^4,Num_training_files);
for k=1:Num_training_files
    filename = [trainpath train_filenames(k).name];   % kth-filename in the list
    I = imread(filename);
    I1 = imresize(I,[100 100]);
    Ytr(1:10^4,k) = I1(:);
end

Yte = zeros(10^4,Num_test_files);
for k=1:Num_test_files
    filename = [testpath test_filenames(k).name];   % kth-filename in the list
    I = imread(filename);
    I1 = imresize(I,[100 100]);
    Yte(1:10^4,k) = I1(:);
end

