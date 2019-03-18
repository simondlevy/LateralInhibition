function k = getk(x, c)
% localist extraction of coefficients k_i for plotting their history
% during convergence

n = size(c,1);

k = zeros(1,n);

for i = 1:n
    k(i) = dot(x, c(i,:)) / length(x);
end

k = k' / sum(k);
