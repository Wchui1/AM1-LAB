%% LMS function
function [err,wmat] = LMS(xIn, d, u)
% xIn        Signal input
% d       desired response signal
N = size(xIn,1);% 
L = size(xIn,2);%length of the input signal
err = zeros(N,1);% initialize error
w = zeros(N,1);

y_d = d' * xIn;
for k = 1:L   
    x = xIn(:,k);
    y(k) = w'*x;        % Output of the adaptive filter
    err(k) = y_d(k) - y(k) ;        % Rrror in k-th iteration
    % weight
    w = w + u*err(k)'*x;        % Coefficient vector update equation
    wmat(:, k) = w;
end
end
