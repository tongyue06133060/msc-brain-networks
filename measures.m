function T = measures(A)
% MEASURES Computes some measures on graphs
%
% T = MEASURES(A) returns table T with different measures on the
% adjacency matrix A (number of  nodes, f edges, maximum degree,
% clustering coefficient, efficiency).
% 
% Giancarlo Antonucci, Apr 2017.

numNodes = size(A, 1);                      % number of nodes
numEdges = nnz(tril(A));                    % number of edges
maxDegree = max(sum(A, 1));                 % maximum degree
C = clustering(A);                     % clustering coefficient
E = efficiency(A);                     % efficiency

T = table(numNodes, numEdges, maxDegree, C, E);