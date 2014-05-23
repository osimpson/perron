load 'A.mat'

t = 0.0;
m = 200;
hk_1 = heatkernel_dom(A, m, t);
llsm_1 = llsm(A, hk_1);
hk_mat = [t, llsm_1]; %row in a table t \t llsm

while t < 40
    t = t + 1; %over 40 values for alpha
    hk = heatkernel_dom(A, m, t);
    ll = llsm(A, hk);
    row = [t, ll];
    [i,j] = size(hk_mat);
    hk_mat = [hk_mat; row]; %append row for new value of alpha
end