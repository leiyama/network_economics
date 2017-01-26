f2 = problem2c(rnd_wbl);
f3 = problem2c(rnd_prd);
f4 = problem2c(rnd_prd2);

plot(1:20, f2, 1:20, f3, 1:20, f4);
xlabel('r', 'FontSize',14,'FontWeight','bold','Color','r');
ylabel('f(r)', 'FontSize',14,'FontWeight','bold','Color','r');
h = legend('(i)Weibull', '(ii)Paredo', '(iii)Paredo2');
set(h, 'Fontsize', 20);