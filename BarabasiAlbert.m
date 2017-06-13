function A = BarabasiAlbert(N, m0, m)
% BARABASIALBERT Scale-free network using Barabasi-Albert algorithm.
%
% A = BARABASIALBERT(N, M0, M) returns the adjacency matrix A of a scale free
% network with N nodes and average node degree 2*M, starting from a network
% with M0 > 0 nodes (M <= M0).
% 
% Giancarlo Antonucci, Apr 2017.

% Connect m0 nodes:
A = zeros(N);
A(1:m0, 1:m0) = ones(m0) - diag(diag(ones(m0)));

% Connect a new node i to m existing ones at random:
for i = (m0+1):N
    ii = 1:i-1;                 
    k = sum(A(ii,ii), 2);       % degree of existing nodes
    p = k./sum(k);              % attraction probability
    r = rand(i-1,1);
    idx = find(p < r);          % add new edges
    if length(idx) < m
        idx = randsample(idx,length(idx));
    else
        idx = randsample(idx,m);    % select m edges
    end
    A(i,idx) = 1;
end

% Make A symmetric (undirected):
A = sign(A + A');