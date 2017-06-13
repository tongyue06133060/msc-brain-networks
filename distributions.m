% distributions.m finds the interpolant for the degree distribution of the 
% data.

% Degree distibution of data:
p = zeros(50,5);                % degree distribution
for i = 1:5
    ptemp = degreedist(AdjData{i});
    p(:,i) = ptemp(1:50);       % best visualisation
    loglog(p(:,i), 'o')
    hold on
end

% Linear Least Squares problem:
% We want to solve the LLS using QR factorisation on
%
% [log(p_1)]   [1     x_1]
% [log(p_2)] = [1     x_2] * [log(a)] = B * coeff
% [   ...  ]   [...   ...]   [  -b  ]
% [log(p_N)]   [1     x_N]

xtemp = (1:50)';
xtemp = repmat(xtemp, 5, 1);
B = [ones(50*5,1), xtemp];

ptemp = p(:);
B(ptemp == 0, :) = [];      % delete Inf's from log()
ptemp(ptemp == 0) = [];     % same

y = log(ptemp);             % y = log(p_i)
[Q, R] = qr(B);             % QR factorisation
c = Q' * y;

c(3:end) = [];
R(3:end,:) = [];
CoefDist = R \ c;                 % get coefficients as log(a) and -b 
CoefDist(1) = exp(CoefDist(1)); % log(a) --> a
CoefDist(2) = - CoefDist(2);    % -b --> b

% Plot results
loglog(CoefDist(1)*exp(-CoefDist(2)*(1:50))) % interpolant
hold off

xlim([0, 50])
legend('G_1', 'G_2', 'G_3', 'G_4', 'G_5', 'interpolant')
legend('Location','southwest')
xlabel('Degree k')
ylabel('Fraction p_k of nodes with degree k')
title('Degree distribution of the brain data')

% Degree distribution of model:
N = 870; pDup = .6; alpha = 1.9; beta = 1.2; % parameters
for i = 1:20
    Atemp = Model(N, pDup, alpha, beta);
    deg = degreedist(Atemp);
    loglog(deg);
    hold on
end
hold off