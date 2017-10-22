function [res] = projectfaces(img,eig_face)
%% Projects image set onto eigenfaces
%% input - image to project img, eig faces matrix from the other function
%% output - eig coeff.

res = ((eig_face' * eig_face)\(eig_face' * img));