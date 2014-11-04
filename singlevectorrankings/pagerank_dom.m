function [ dom ] = pagerank_dom( A, m, alpha )
%Return the dominance vector \alpha \sum_{k=1}^m (1-\alpha)^k A^ke/e^TA^ke.
    %A is the dominance matrix, 0<alpha<1 is the jump probability

[i,j] = size(A);
c = zeros(i,1);
for k = 1:m
    c = c + (1 - alpha)^k * perron_term(A, k);
end

dom = alpha * c;

end

