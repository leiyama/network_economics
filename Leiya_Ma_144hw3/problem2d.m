function [  ] = problem2d( x, N )
%PROBLEM2D Summary of this function goes here
%   Detailed explanation goes here

% x represents the distribution we want to draw
% N represents the number of bar we want to divide to
Max = max(x);
Min = max(min(x), 0);
n = length(x);
h = (Max - Min)/N;

plot_x = zeros(N, 1);
frequency = zeros(N, 1);
rank = zeros(N, 1);
for i = 1:n
    if x(i) == Min
        frequency(1) = frequency(1) + 1;
    else 
        if x(i) > Min
            j = ceil((x(i) - Min)/h);
            frequency(j) = frequency(j) + 1;
        end
    end
end

for i = 1:N
    plot_x(i) = Min + h * (i - 0.5);
end

rank(1) = n;
for i = 2:N
    rank(i) = rank(i - 1) - frequency(i -1);
end
rank = rank /n;

k = 0;
for i = 1:N
    if frequency(i) > 0;
        k = k + 1;
        new_frequency(k) = log(frequency(i));
        new_rank(k) = log(rank(i));
        new_plot_x(k) = log(plot_x(i));
        weight(k) = (log(2* plot_x(i)/plot_x(1)))^(-1);
    end
end
%new_plot_x=new_plot_x';
e = ones(k, 1);

cfre = [(new_plot_x)', e]' * [(new_plot_x)', e] \ [(new_plot_x)', e]' * new_frequency';
wcfre = [(new_plot_x)', e]' * diag(weight)^2 * [(new_plot_x)', e] \ [(new_plot_x)', e]'* diag(weight)^2 * new_frequency';

crank = [(new_plot_x)', e]' * [(new_plot_x)', e] \ [(new_plot_x)', e]' * new_rank';

figure(1)
plot(new_plot_x, new_frequency, '+', new_plot_x, cfre(1) * new_plot_x + cfre(2), new_plot_x, wcfre(1) * new_plot_x + wcfre(2));
title('Frequency log-log plot');
xlabel('log', 'FontSize',14,'FontWeight','bold','Color','r');
ylabel('log', 'FontSize',14,'FontWeight','bold','Color','r');
h = legend('(i)frequency', '(ii)LR', '(iii)WLR');
set(h, 'Fontsize', 14);
hold on;

figure(2)
plot(new_plot_x, new_rank, '+', new_plot_x, crank(1) * new_plot_x + crank(2));
title('Rank log-log plot');
xlabel('log', 'FontSize',14,'FontWeight','bold','Color','r');
ylabel('log', 'FontSize',14,'FontWeight','bold','Color','r');
h = legend('(i)rank', '(ii)LR');
set(h, 'Fontsize', 14);

end

