% comparison.m compares Watts-Strogatz, Barabasi-Albert and the proposed 
% model with the data.

N = 870;                            % mean number of nodes
numRuns = 20;                       % number of runs to average on
pDup = .6; alpha = 1.9; beta = 1.2; % parameters of proposed model
GamMod = cell(3,1);                 % gamma distributions
deg = cell(numRuns,1);              % degree distributions

for i = 1:3
    for j = 1:numRuns
        if i == 1
            Atemp = adjacency(WattsStrogatz(N, 5, .4)); % Watts-Strogatz
        elseif i == 2
            Atemp = BarabasiAlbert(N, 7, 5);            % Barabasi-Albert
        elseif i == 3
            Atemp = Model(N, pDup, alpha, beta);        % Proposed
        end

        % Delete disconnected nodes:
        idx = (sum(Atemp) == 0);
        Atemp(idx, :) = []; Atemp(:, idx) = [];
        
        % Spectral analysis:
        [~, ~, GamMod{i}(j,:)] = spec(Atemp{i});
    end
end
GamMod{1} = mean(GamMod{1});    % mean distribution WS
GamMod{2} = mean(GamMod{2});    % mean distribution BA
GamMod{3} = mean(GamMod{3});    % mean distribution proposed

% Plots:
plot(x,GamData{1}, x,GamMod{1}, x,GamMod{2}, x,GamMod{3});
xlabel('Eigenvalue '),
ylabel('Gamma distribution')
title('Comparison with models')
legend('Brain Network', 'WS', 'BA', 'Proposed')