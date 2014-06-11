function [ o, d, r ] = minimizingeigoffensedefense( B )
%Compute the offense/defense ranking vectors and scalar r
%   B is a skew-symmetric pairwise dominance matrix.  Then if l=ir is the
%   eigenvalue and f=a+bi the corresponding eigenvector which minimizes
%   ||B-lff^*||.  We output a=offense ranking, b=defense ranking, r=scalar.

n = size(B, 1);

[V, L] = eig(B);

dom = zeros(n,1);
for i=1:n
    f = V(:,i); %the ith eigenvector
    spec = L(i,i)*f*f'; %one term in the spectral decomposition
    dom(i) = norm(B - spec);
end

[val, ind] = min(dom, [], 1); %ind is the index of the term minimizing the difference

l = L(ind, ind);
r = imag(l);
f = V(:,ind);
o = real(f);
d = imag(f);

end

