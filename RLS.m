function [e,wmat] = RLS(xin,dn)
N = size(xin, 1);
e = zeros(N,1);
L = size(xin, 2);
yd = dn' * xin;
% Initialisation for RLS algorithm
alpha = 1;
delta = 0.7;
w_rls = zeros(N,1); 
R = eye(N)/delta;
% Run RLS algorithm
for i = 1:L
    x = xin(:,i);
    e(i) = yd(i)- w_rls'*x; % Calculate error
    R = R - (R*(x*x')*R)/(alpha+x'*R*x); % Calculate Hermitian matrix R
    w_rls = w_rls + R*x*e(i)'; % Update weights
    wmat(:, i) = w_rls;
end
end

