function [  ] = problem2b( Sn )
%PROBLEM2B Summary of this function goes here
%   Detailed explanation goes here
n = length(Sn);
S = zeros(10000, 1);
for i = 1:10000
  S(i) = (Sn(i) - i)/sqrt(i);
end

figure(1)
plot(1:10000, S(1:10000));
xlabel('n', 'FontSize',14,'FontWeight','bold','Color','r');
ylabel('(Sn-nE[x])/sqrt(n)', 'FontSize',14,'FontWeight','bold','Color','r');


