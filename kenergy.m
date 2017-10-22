%% k-energy plot
function [enrg] = kenergy(img,C)
eig_face = eigenfaces(C,10^4);
enrg = zeros(9,1);
proj = projectfaces(img, eig_face);
total = sum((img(:).^2));
for k=2:10
    enrg(k-1) = sum(proj(1:k).^2)/total;
end