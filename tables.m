% tables.m returns tables of measures on data, random samples, proposed
% model.

% Measures on data:
for i = 1:5
    if i == 1
        TabData = measures(A{i});
    else
        TabData = vertcat(TabData, measures(A{i}));
    end
end

T1 = table(mean(TabData{:,1}), mean(TabData{:,2}), mean(TabData{:,3}),...
    mean(TabData{:,4}), mean(TabData{:,5}),...
    'VariableNames', {'numNodes', 'numEdges', 'maxDegree', 'C', 'E'});
T2 = table(std(TabData{:,1}), std(TabData{:,2}), std(TabData{:,3}),...
    std(TabData{:,4}), std(TabData{:,5}),...
    'VariableNames', {'numNodes', 'numEdges', 'maxDegree', 'C', 'E'});
TabData = vertcat(TabData,T1,T2); % table of measures (T), their mean (T1) and std (T2)

% Measures on randomised samples (100 per original graph):
numAttempts = 10;
for i = 1:numAttempts
    selGraph = mod(i,5); if selGraph == 0, selGraph = 5; end,
    
    AdjRand = rewire(A{selGraph}, 4*nnz(triu(A{selGraph})));
    idx = (sum(AdjRand) == 0); AdjRand(idx, :) = []; AdjRand(:, idx) = [];
    
    if i == 1
        TabRand = measures(AdjRand);
    else
        TabRand = vertcat(TabRand, measures(AdjRand));
    end
end

T1 = table(mean(TabRand{:,1}), mean(TabRand{:,2}), mean(TabRand{:,3}),...
    mean(TabRand{:,4}), mean(TabRand{:,5}), ...
    'VariableNames', {'numNodes', 'numEdges', 'maxDegree', 'C', 'E'});
T2 = table(std(TabRand{:,1}), std(TabRand{:,2}), std(TabRand{:,3}),...
    std(TabRand{:,4}), std(TabRand{:,5}), ...
    'VariableNames', {'numNodes', 'numEdges', 'maxDegree', 'C', 'E'});
TabRand = vertcat(T1,T2); % table of mean (T1) and std (T2)

% Measures on proposed model:
N = 870; pDup = .6; alpha = 1.9; beta = 1.2; % parameters
for i = 1:20
    Atemp = Model(N, pDup, alpha, beta);
    
    if i == 1
        TabMod = measures(Atemp);
    else
        TabMod = vertcat(TabMod, measures(Atemp));
    end
end

T1 = table(mean(TabMod{:,1}), mean(TabMod{:,2}), mean(TabMod{:,3}),...
    mean(TabMod{:,4}), mean(TabMod{:,5}),...
    'VariableNames', {'numNodes', 'numEdges', 'maxDegree', 'C', 'E'});
T2 = table(std(TabMod{:,1}), std(TabMod{:,2}), std(TabMod{:,3}),...
    std(TabMod{:,4}), std(TabMod{:,5}),...
    'VariableNames', {'numNodes', 'numEdges', 'maxDegree', 'C', 'E'});
TabMod = vertcat(T1,T2); % measures (Tp), their mean (T1) and std (T2)