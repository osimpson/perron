function [ vec, ind ] = dominanteig( B )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

n = size(B, 1);

[V, L] = eig(B);

dom = zeros(n,1);
for i=1:n
    f = V(:,i); %the ith eigenvector
    spec = L(i,i)*f*f'; %one term in the spectral decomposition
    dom(i) = norm(B - spec);
end

[val, ind] = min(dom, [], 1); %ind is the index of the term minimizing the difference
vec = V(:,ind);

end

