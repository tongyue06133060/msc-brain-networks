function E = efficiency(A)
% EFFICIENCY Global efficiency.
%
% E = EFFICIENCY(A) returns the global efficiency E (Latora and Marchiori, 
% 2001) of a graph from its binary undirected adjacency matrix A.
% 
% Giancarlo Antonucci, Apr 2017.

G = graph(A);               % graph
D = distances(G);           % shortest paths
Dinv = 1./D;                % inverse distances
Dinv(D == 0) = 0;           % set Inf to 0
n = size(A,1);              % number of nodes
E = sum(Dinv(:))/(n^2 - n); % global efficiency