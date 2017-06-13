function P = degreedist(A)
% DEGREEDIST Degree distributions.
%
% P = DEGREEDIST(A) returns the degree distribution of an undirected
% adjacency matrix A.
%
% [PIN, POUT, PJ] = DEGREEDIST(A) returns the indegree distribution PIN,
% the outdegree distribution POUT and the joint probability PJ of a 
% directed adjacency matrix A.
%
% Giancarlo Antonucci, Apr 2017.

n = size(A,1);      % number of nodes
k = sum(A,1);       % degrees
kmax = max(k);
P = zeros(kmax,1);  % degree distribution
for i = 1:kmax
    P(i) = nnz(k == i)/n;
end