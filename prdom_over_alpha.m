load 'A.mat'

alpha = 0.0;
m = 400;
pr_1 = pagerank_dom(A, m, alpha);
llsm_1 = llsm(A, pr_1);
pr_mat = [alpha, llsm_1]; %row in a table alpha \t llsm

while alpha < 0.01
    alpha = alpha + 0.0001; %over 100 values for alpha
    pr = pagerank_dom(A, m, alpha);
    ll = llsm(A, pr);
    row = [alpha, ll];
    [i,j] = size(pr_mat);
    pr_mat = [pr_mat; row]; %append row for new value of alpha
end
    