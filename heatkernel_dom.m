function [ dom ] = heatkernel_dom( A, m, t )
%Return the dominance vector e^{-t} \sum_{k=1}^m t^k/k! A^ke/e^TA^ke.
    %A is the dominance matrix, t is any real number ~ temperature

[i,j] = size(A);
c = zeros(i,1);
for k = 1:m
    c = c + t^k/factorial(k) * perron_term(A, k);
end

dom = exp(-t) * c;
        
end

