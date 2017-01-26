function [ ] = problem2aplot( Sn )
%PROBLEM2APLOT Summary of this function goes here
%   Detailed explanation goes here

figure(1)
plot(1:20, Sn(1:20));
xlabel('n', 'FontSize',14,'FontWeight','bold','Color','r');
ylabel('Sn', 'FontSize',14,'FontWeight','bold','Color','r');
hold on;

figure(2)
plot(1:10000, Sn(1:10000));
xlabel('n', 'FontSize',14,'FontWeight','bold','Color','r');
ylabel('Sn', 'FontSize',14,'FontWeight','bold','Color','r');
hold on;
    
end
