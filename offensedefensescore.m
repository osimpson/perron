function [ score ] = offensedefensescore( A, o, d, r )
%Computes the ranking score of ranking vectors representing offensive 
%ranking and defensive ranking for matrix A
%   f = o + id is a good ranking vector if o(u)d(v)-d(u)o(v) ~ A(u,v).
%   Thus we assign the matrix R(u,v) = o(u)d(v)-d(u)o(v) and compute the
%   normed difference ||R-A||.
%
%   If we pass the argument r, we use spectral decomposition for our
%   ranking, R = v*f*transpose(f) where v=ir is the eigenvalue
%   corresponding to f = o + id.  In this case, we assign the matrix
%   R(u,v) = r[o(u)d(v)-d(u)o(v)].
%
%   Parameters:
%       A is an nxn matrix
%       o, d are real column vectors of size n
%       r is a real number

n = size(o,1);
R = zeros(n,n);

if nargin < 4
    for u=1:n
        for v=1:n
            R(u,v) = o(u)*d(v)-d(u)*o(v);
        end
    end
else
    for u=1:n
        for v=1:n
            R(u,v) = r*(o(u)*d(v)-d(u)*o(v));
        end
    end
end

score = norm(A-R);
