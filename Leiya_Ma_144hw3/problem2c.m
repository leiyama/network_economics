function [ f ] = problem2c( X )
%PROBLEM2C Summary of this function goes here
%   Detailed explanation goes here
n = 10000;
x_sorted = sort(X, 'descend');
Sum = sum(X);
f = zeros(20, 1);

for r = 1:20
    f(r) = sum(x_sorted(1:(r*n/100)))/Sum;
end 