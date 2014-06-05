A = genreciprocalmatrix(100, 10);
B = log(A);

%fileID = fopen('ranktest.txt', 'w');
fprintf(fileID, '%s\n', 'Testing the offense/defense vectors as ranking vectors for a positive');
fprintf(fileID, '%s\n', 'reciprocal 100x100 matrix A.  The vector are the real and imaginary parts of');
fprintf(fileID, '%s\n', 'the eigenvector f=o+id of B=log(A) corresponding to the maximal eigenvalue.');
fprintf(fileID, '%s\n', 'Sometime we will use the ranking including the imaginary part of the');
fprintf(fileID, '%s\n\n', 'corresponding eigenvalue, r.');

%some tests
%[f, ind] = dominanteig(B);

lambdaB = eig(B);
[V,L] = eig(B);
L = abs(lambdaB);
[l, ind] = max(L);
f = V(:,ind);

o = real(f);
d = imag(f);
%l = L(ind, ind);
r = imag(l);
s1 = offensedefensescore(B, o, d);
fprintf(fileID,'%s\t %f\n', 'Offense/defense score for B without eigenvalue', s1);
s2 = offensedefensescore(B, o, d, r);
fprintf(fileID,'%s\t %f\n', 'Offense/defense score for B with eigenvalue', s2);
s3 = offensedefensescore(A, o, d);
fprintf(fileID,'%s\t %f\n', 'Offense/defense score for A without eigenvalue', s3);
s4 = offensedefensescore(A, o, d, r);
fprintf(fileID,'%s\t %f\n', 'Offense/defense score for A with eigenvalue', s4);

s5 = rankingscore(A, f);
s6 = rankingscore(A, abs(f));
fprintf(fileID,'%s\t %f\n', 'Ratio score for A using f', s5);
fprintf(fileID,'%s\t %f\n', 'Ratio score for A using abs(f)', s6);

p = perron_dom(A, 100);
s7 = rankingscore(A, p);
fprintf(fileID,'%s\t %f\n', 'Ratio score for A using perron vector', s7);

fclose(fileID);