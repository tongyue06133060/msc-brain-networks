function C = clustering(A)
% CLUSTERING Global clustering coefficient.
%
% C = CLUSTERING(A) returns the global clustering coefficient C (Newman, 
% 2003) of a binary undirected adjacency matrix A.
%
% Giancarlo Antonucci, Apr 2017.

k = sum(A,1);                               % degrees
numTriangles = .5*diag((A+A')^3);           % existing triangles
allTriangles = k.*(k-1);                    % all possible triangles
C = sum(numTriangles)/sum(allTriangles);    % global clustering coefficient