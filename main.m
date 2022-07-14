% Initialization
% clear all; close all; clc;
% 
% Configuration
total_candy = 2000000;
days = 81;
% 
% % step1
% partial gradient
% partial_xi = 50 + xi/500 + (81-i+1)/2
% 
% % step2
% constrain 
% x1 + x2 + ... + x81 = total_candy
% partial gradient of xi = 1
% 
% % step3
% partial gradient w.r.t. constrain
% partial_xi = 50 + xi/500 + (81-i+1)/2 + alpha
% partil_xi = 0 => xi = -500(50 + (81-i+1)/2 + alpha)
%                     = -500(50 + (81-i+1)/2) - 500*alpha
% 
% % step4
% apply xi to the constain to find alpha for all days
% total = 0
% for i = 1:81
%   total += -500(50 + (81-i+1)/2)
% end
% total - 500*81*alpha = total_candy
% alpha = (total_candy - total)/(-500*81)
% 
% % step5
% calculate the value of xi by applying formula in step3 
%   and alpha found in step4

% codes
total = 0;
for i = 1:81
    total = total - 500*(50+(days - i + 1)/2);
end

val = -500*81;
alpha = (total_candy - total)/val;

R_list = zeros(81,1);
for i = 1:days
    xi = -500*(50+(days-i+1)/2+alpha);
    if xi < 0
        error("value is negative")
    else
        R_list(i) = xi;
    end
end

disp("x0 is uniform case")
disp("x_val is the lagrange case")
disp(" ")

x0 = total_candy/days * ones(days,1);
cost_x_val = cost_function(R_list(i));

cost_x_storage2 = cost_function2(R_list(i));
cost_x0 = cost_function(x0);
format short g
disp("value of x0")
disp(cost_x0)
disp("value of x_val")
disp(cost_x_val)
disp("value of x_val - value of x0")
disp(cost_x_val - cost_x0)
disp("total cost with storage and variable storage")

disp(cost_x_storage2)
format short g
disp(R_list);
size(R_list);