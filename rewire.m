function A = rewire(A, numSteps)
% REWIRE Rewires edges.
% 
% A = REWIRE(A, NUMSTEPS) returns the adjacency matrix A after NUMSTEPS
% rewiring steps.
% 
% This code is based on Maslov and Sneppen.

% Save all nodes:
[rowsA, colsA] = find(A);
idx = find(rowsA > colsA);
rowsA = rowsA(idx);
colsA = colsA(idx);

numEdges = length(rowsA);
if (nargin < 2)
    numSteps = numEdges;
end

numRewiring = 0;
for i = 1:numSteps
    
    % Select nodes:
    Edge1 = randi(numEdges);
    Edge2 = randi(numEdges);
    j = rowsA(Edge1);
    k = colsA(Edge1);
    l = rowsA(Edge2);
    m = colsA(Edge2);
   
    % Swap edges:
	if ~any(diff([j k l m]) == 0)
        if rand > 0.5
            change = l;
            l = m;
            m = change; 
        end
        
        if (A(j,l) == 0) && (A(k,m) == 0)
            A(j,k) = 0;
            A(l,m) = 0;
            A(k,j) = 0;
            A(m,l) = 0;
            A(j,l) = 1;
            A(k,m) = 1;
            A(l,j) = 1;
            A(m,k) = 1; 
            
            rowsA(Edge1) = j;
            colsA(Edge1) = l;
            rowsA(Edge2) = k;
            colsA(Edge2) = m;
            
            numRewiring = numRewiring + 1;
        end;
	end;
end;