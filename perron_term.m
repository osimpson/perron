function a = perron_term(A, k)

[n,m] = size(A);
e = ones(n,1);
num = A^k*e;
den = transpose(e)*A^k*e;
a = num./den;