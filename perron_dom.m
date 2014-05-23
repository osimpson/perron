function [ dom ] = perron_dom( A, m )
%Return the dominance vector 1/m \sum_{k=1}^m A^ke/e^TA^ke.
%   A is the dominance matrix

[i,j] = size(A);
c = zeros(i,1);
for k = 1:m
    c = c + perron_term(A, k);
end

dom = c./m;

end