% motifs.m computes the motif analysis of the data.

for i = 1:5
    M3 = motif3struct_bin(full(A));
    M3 = M3([9 13], :);                         % number of 3-motifs

    M4 = motif4struct_bin(full(A));
    M4 = M4([113 126 128 187 193 199], :);      % number of 4-motifs

    T1 = table(M3(1), M3(2), M4(1), M4(2), M4(3), M4(4), M4(5), M4(6), ...
        'VariableNames', {'M1', 'M2', 'M3', 'M4', 'M5', 'M6', 'M7', 'M8'});
    if i == 1
        Motifs = T1;
    else
        Motifs = vertcat(Motifs, T1);
    end
end

T1 = table(mean(Motifs{:,1}), mean(Motifs{:,2}), mean(Motifs{:,3}), ...
    mean(Motifs{:,4}), mean(Motifs{:,5}), mean(Motifs{:,6}), ...
    mean(Motifs{:,7}), mean(Motifs{:,8}), ...
    'VariableNames', {'M1', 'M2', 'M3', 'M4', 'M5', 'M6', 'M7', 'M8'});
T2 = table(std(Motifs{:,1}), std(Motifs{:,2}), std(Motifs{:,3}), ...
    std(Motifs{:,4}), std(Motifs{:,5}), std(Motifs{:,6}), ...
    std(Motifs{:,7}), std(Motifs{:,8}), ...
    'VariableNames', {'M1', 'M2', 'M3', 'M4', 'M5', 'M6', 'M7', 'M8'});
Motifs = vertcat(Motifs,T1,T2); % motif fingerprints, with mean and std