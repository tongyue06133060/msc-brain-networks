function [L, lambda, gamma] = spec(A)
% SPEC Spectrum of normalised Laplacian.
%
% [L, LAMBDA, GAMMA] = SPEC(A) returns the normalised laplacian
% L, its eigenvalues LAMBDA and spectral plot with gaussian kernel GAMMA
% from the adjacency matrix A.
%
% Giancarlo Antonucci, Apr 2016.

d = sum(A,2);         	% degrees
D = diag(d);           	% diagonal matrix fo degrees
L = eye(size(A)) - D\A;	% laplacian matrix

lambda = eig(L);        % eigenvalues

x = linspace(0,2,2001);                 % eigenvalue space
sigma = .015;                           % standard deviation
gamma = sum(normpdf(x, lambda, sigma)); % gaussian kernel