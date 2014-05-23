function [ llsm ] = llsm( A, v )
%Measure of how good a ranking a vector is in terms of the log least
%squares method (LLSM).
%   \sum_{i,j}(\log(a_{ij}) - \log(v_i/v_j))^2
    % A is the dominance matrix, v is the vector to measure

llsm = 0;

[n,m] = size(A);

for i = 1:n
    for j = 1:n
        llsm = llsm + (log(A(i,j)) - log(v(i)/v(j)))^2;
    end
end

end

