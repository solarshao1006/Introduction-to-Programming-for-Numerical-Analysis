function [total_cost] =cost_function(R_list)
% R_list is a 1 by 81 array
% R_list(i) is the rate of candies at day i
n=size(R_list);
R_list = reshape(R_list,[1,81]);
total_cost = R_list*(50+R_list/1000)'+ (cumsum (R_list)/2)*ones(81,1);
