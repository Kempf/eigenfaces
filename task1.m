% u5568225 CLAB4
clear all;
close all;
% params
%num_train = 135;
num_train = 137;                 
%num_test = 10;
num_test = 11;
k = 10;
% read all faces
[A_train, A_test] = readyalefaces(num_train,num_test);
% substact mean vector
mean_face = mean(A_train,2);
%figure('Name','Average face');
%imshow(uint8(reshape(mean_face,[100,100])));
A1 = A_train - repmat(mean_face,1,num_train);
A2 = A_test - repmat(mean_face,1,num_test);
% cov matrix
C = A1*A1';
% calculate sorted eigenvalues and vectors
eig_face = eigenfaces(C,k);
% show eigenfaces
figure('Name',sprintf('Eigenfaces for k=%d',k));
for img=1:k
    subplot(2,ceil(k/2),img);
    imshow(mat2gray(reshape(eig_face(:,img),[100,100])));
end
% project both sets onto eigenfaces
train = projectfaces(A1, eig_face);
test = projectfaces(A2, eig_face);
% calculate distances
eucd = zeros(num_test,num_train);
match = zeros(num_test,3);
for i = 1:num_test
    for j = 1:num_train
        eucd(i,j) = norm(test(:,i)-train(:,j));
    end
    % find best matches
    [~,ind] = sort(eucd(i,:),'ascend'); 
    match(i,:) = ind(1:3);
end
% plot matches
figure('Name',sprintf('Facial matches for k=%d',k));
for i = 1:num_test
    subplot(4,num_test,i);
    imshow(uint8(reshape(A_test(:,i),[100,100])));
    title(sprintf('Test img no. %d',i));
    for j = 1:3
        subplot(4,num_test,i+num_test*j);
        imshow(uint8(reshape(A_train(:,match(i,j)),[100,100])));
        title(sprintf('Train img no. %d',match(i,j)));
    end
end
% Report Q1 - K energies
figure('Name','Energy of first k eigenfaces');
stem(2:10,kenergy(A1(:,11),C));
% Report Q2 - K display
kdisplay = @(img,k) imshow(uint8(reshape(eig_face(:,1:k)*test(1:k,img)+mean_face,[100,100])));
figure('Name','Projections for different k values');
for k=2:2:10
    subplot(1,5,k/2);
    kdisplay(11,k);
    title(sprintf('k=%d',k));
end