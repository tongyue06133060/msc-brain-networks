function L = charpath(A)
% CHARPATH Characteristic path length.
%
% L = CHARPATH(A) returns the characteristic path length L (Watts and 
% Strogatz, 1998) of a binary undirected adjacency matrix A.
% 
% Giancarlo Antonucci, Apr 2017.

G = graph(A);                   % graph
D = distances(G);               % shortest paths
L = D - diag(D);                % force distance(i,i) = 0
L = sum(L(:))/(size(A,1) - 1);  % charachteristic path length