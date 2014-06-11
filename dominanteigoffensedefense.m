function [ o, d, r ] = dominanteigoffensedefense( B )
%Compute the offense/defense ranking vectors and scalar r
%   B is a skew-symmetric pairwise dominance matrix.  Then if l=ir is the
%   maximal eigenvalue, let f=a+bi be the corresponding eigenvector.  We
%   output a=offense ranking, b=defense ranking, r=scalar

lambdaB = eig(B);
lambdaB = abs(lambdaB);
[l, ind] = max(lambdaB); % get index of dominant eigenvalue

[V,L] = eig(B); % V is the matrix whose columns are eigenvectors,
                % L has corresponding eigenvalues on the diagonal.
l = L(ind, ind);
r = imag(l);
f = V(:,ind);
o = real(f);
d = imag(f);

end

