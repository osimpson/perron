function [ o, d, r, proj, projY ] = dominanteigoffensedefense( B )
%Compute the offense/defense ranking vectors and scalar r
%   B is a skew-symmetric pairwise dominance matrix.  Then if l=ir is the
%   maximal eigenvalue, let f=a+bi be the corresponding eigenvector.  We
%   output a=offense ranking, b=defense ranking, r=scalar
%Also compute our projection matrix and the Youla projection

lambdaB = eig(B);
lambdaB = abs(lambdaB);
[l, ind] = max(lambdaB); % get index of dominant eigenvalue

[V,L] = eig(B); % V is the matrix whose columns are eigenvectors,
                % L has corresponding eigenvalues on the diagonal.
l1 = L(ind, ind);
r = imag(l);
v1 = V(:,ind);
o = real(v1);
d = imag(v1);

l2 = conj(l1);
v2 = conj(v1);
o2 = real(v2);
d2 = imag(v2);

% our projection with v1*v1'
proj = l1*v1*v1' + l2*v2*v2';

% youla projection with fg' - gf'
projY = imag(l1)*(o*d' - d*o') + imag(l2)*(o2*d2' - d2*o2');

% proj1 == proj2 has negligible error along diagonal
end

