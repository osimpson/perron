function [ score ] = rankingscore( A, r )
%Computes the ranking score of ranking vector r for matrix A
%   r is a good ranking vector if r(i)/r(j) is close to A(i,j)
%   thus we assign the matrix R(i,j) = r(i)/r(j) and test the normed
%   difference ||R-A||.

%   Assume r is a column vector

n = size(r,1);
R = zeros(n,n);

for i=1:n
    for j=1:n
        R(i,j) = r(i)/r(j);
    end
end

score = norm(A-R);

end

