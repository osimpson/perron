function [ A ] = genreciprocalmatrix( n, entrybound )
%generate a random positive reciprocal matrix A of size n whose entries are
%bounded by entrybound
%   Detailed explanation goes here

A = entrybound*rand(n); %random nxn matrix
A = triu(A,1); %take upper triangular matrix of A
A(logical(eye(size(A)))) = 1; %put 1's on the diagonal
B = transpose(A);
B = B + triu(ones(n),1);
B = 1./B;
B = tril(B,-1); %lower triangular reciprocal of A
A = A+B;

end