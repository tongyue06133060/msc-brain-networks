% brains.m computes adjacency matrix, laplacian and spectrum of the data.

AdjData = cell(5,1);	% adjacency matrices
LaplData = cell(5,1);	% laplacian matrices
EigData = cell(5,1);	% eigenvalue spectra
GamData = cell(5,1);	% gamma distribution

for i = 1:5
    
    % Load different datasets for the same individual
    if i == 1, load('100408_connectome_scale500.mat');
    elseif i == 2, load('101006_connectome_scale500.mat');
    elseif i == 3; load('101107_connectome_scale500.mat');
    elseif i == 4; load('101309_connectome_scale500.mat');
    elseif i == 5; load('100307_connectome_scale500.mat');
    end
    
    % Build and store the networks:
    AdjData{i} = adjacency(graph(Source,Target));
    
    % Delete disconnected nodes:
    idx = (sum(AdjData{i}) == 0);
    AdjData{i}(idx, :) = []; AdjData{i}(:, idx) = [];
    
    % Spectral analysis:
    [LaplData{i}, EigData{i}, GamData{i}] = spec(AdjData{i});
end

% Plot results:
x = linspace(0, 2, 2001);
for i = 1:5, plot(x, GamData{i}); hold on, end, hold off
xlabel('Eigenvalue')
ylabel('Gamma distribution')
title('Spectral plots of the brain networks')
legend('G_1', 'G_2', 'G_3', 'G_4', 'G_5')