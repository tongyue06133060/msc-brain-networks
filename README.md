# Human Brain Networks

This repository accompanies the paper "Human Brain Networks", by Giancarlo Antonucci, submitted as part of the MSc in 
Mathematical Modelling and Scientific Computing at The University of Oxford.

The main features of the human brain are still unclear. In this project, I explored some of its basic mechanisms. In particular, I studied some datasets of human brain networks, comparing them to small world and scale free networks, and studying their Laplacian matrices. A generative model was proposed too.

--------------------------

Datasets:
- 100307_connectome_scale500: 1st brain dataset
- 100408_connectome_scale500: 2nd brain dataset
- 101006_connectome_scale500: 3rd brain dataset
- 101107_connectome_scale500: 4th brain dataset
- 101309_connectome_scale500: 5th brain dataset

Main codes:
- brains: computes adjacency matrix, laplacian and spectrum of the datasets
- comparison: compares Watts-Strogatz, Barabasi-Albert and the proposed model with the data
- distributions: finds the interpolant for the degree distribution of the data
- motifs: computes the motif analysis of the data (codes can be found at https://sites.google.com/site/bctnet/)
- tables: tables of measures (from measures.m) on data, some random samples, and the proposed model

Auxiliary codes:
- BarabasiAlbert: scale-free network using Barabasi-Albert algorithm
- charpath: characteristic path length
- clustering: global clustering coefficient
- degreedist: degree distributions
- efficiency: global efficiency
- measures: number of  nodes, of edges, maximum degree, clustering coefficient, efficiency
- Model: candidate neural model
- rewire: rewires edges so as to randomise the network (based on Maslov and Sneppen)
- spec: spectrum of normalised Laplacian
- WattsStrogatz: small-world network using Watts-Strogatz algorithm

Moreover, the dataset full_computed_data.mat contains all the results we computed using the previous codes:
- AdjData: adjacency matrices of the data
- CoefDist: coefficients of the interpolant of the degree distribution
- EigData: eigenvalues of laplacians of the data
- GamData: gamma distribution of EigData
- GamMod: mean gamma distribution of eigenvalues from the models (WS, BA, proposed)
- LaplData: laplacians of the data
- Motifs: motif fingerprints of the data
- TabData: measures from the data
- TabMod: mean measures from the proposed model
- TabRand: mean measures from the data after randomisation
