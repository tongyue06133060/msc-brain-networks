function A = Model(N, pDup, alpha, b)
% MODEL Candidate neural model.
%
% A = MODEL(N, PDUP, ALPHA, BETA) returns the adjacency matrix A of a 
% candidate neural model built in this way:
% 
% - set N number of nodes
% - for i going from 1 to N
% - - duplicate a node with probabilit PDUP
% - - add nodes using a spatial model with parameters ALPHA and B
% - end
% 
% The code is based on ideas from (Itzhack and Louzoun, 2010) and 
% (Banerjee, 2008). Its features are discussed in the main article.
%
% Giancarlo Antonucci, Apr 2017.

A = zeros(N);
load('101006_connectome_scale500.mat') % for spatial coordinates x y z
x = d0; y = d1; z = d2;

for i = 1:N
    % Addition
	d = sqrt((x(i)-x(1:i)).^2 + (y(i)-y(1:i)).^2 + (z(i)-z(1:i)).^2);
	p = b*d'.^(-alpha); % attraction probability
    
    r = rand(1, i);
    A(i, r < p) = 1;    % add new edges
    
    % Duplication
    if rand <= pDup
        selNode = randi(i, 1);
        A(i, :) = A(i, :) + A(selNode, :);
    end
end

% Make A symmetric (undirected):
A = sign(A + A');