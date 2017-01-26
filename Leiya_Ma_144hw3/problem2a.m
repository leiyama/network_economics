
rnd_norm = normrnd(1, 1, 10000, 1);
rnd_wbl = wblrnd(1/gamma(1 + 1/0.3), 0.3, 10000, 1);
rnd_prd = gprnd(1/1.5, 2/9, 1/3, 10000, 1);
rnd_prd2 = gprnd(2, 2/3, 1/3, 10000, 1);

norm_sum = zeros(10000, 1);
wbl_sum = zeros(10000, 1);
prd_sum = zeros(10000, 1);
prd2_sum = zeros(10000, 1);

norm_sum(1) = rnd_norm(1);
wbl_sum(1) = rnd_wbl(1);
prd_sum(1) = rnd_prd(1);
prd2_sum(1) = rnd_prd2(1);

for i = 2:10000
    norm_sum(i) = norm_sum(i - 1) + rnd_norm(i);
    wbl_sum(i) = wbl_sum(i - 1) + rnd_wbl(i);
    prd_sum(i) = prd_sum(i - 1) + rnd_prd(i);
    prd2_sum(i) = prd2_sum(i - 1) + rnd_prd2(i);
end


