function a = noise(varargin)
% NOISE Random array of -1s and +1s.
%
%   A = NOISE(M, N) is an MxN matrix of -1, +1.
%   A = NOISE(SIZE(A)) is the same size as A but contains -1, +1.  

a = 2 * (rand(varargin{:}) < 0.5) - 1;



