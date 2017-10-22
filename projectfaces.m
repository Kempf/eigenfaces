function [res] = projectfaces(img,eig_face)
%% Projects image set onto eigenfaces

res = ((eig_face' * eig_face)\(eig_face' * img));