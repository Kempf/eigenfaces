function [eig_face] = eigenfaces(C,k)
%% returns eigenfaces 

% load or calculate eigenvalues
if ~exist('eig.mat')
    [V,D] = eig(C);
    save('eig.mat','V','D');
else
    load('eig.mat');
end
[eig_val,ind] = sort(diag(D),'descend');
eig_vec = V(:,ind);
% take top k vectors
if size(eig_vec,2) >= k
    eig_face = eig_vec(:,1:k);
else
    error('Not enough eigenvectors - check image matrix');
end