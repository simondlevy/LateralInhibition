function dlidemo(syms, dims, perms, seed)
% DLIDEMO(SYMS, DIMS, PERMS) demonstrates distributed lateral inhibition on 
% a vector symbolic architecture system with SYMS symbols, DIMS
% dimensions, and PERMS permutations.
%
% DLIDEMO(SYMS, DIMS, PERMS, SEED) supports seeding random number generator 
% for reproducible results.


% Distance between L2 norms of successive solutions for convergence
EPSILON = 1e-2;

% amount to "privilege" the winner at start
PRIV = 1.1;

% seed random if indicated
if nargin > 3
    rand('state', seed)
end

% randomly choose a winner
j = ceil(rand*syms);
fprintf('Winner = %d\n', j)

% create symbols as vectors of random noise
a = noise(syms, dims);

% create a permutation dictionary
p = permdict(a, perms);

% augment winner
a(j,:) = a(j,:) * PRIV;

% create initial state vector from sum of vectors
x = sum(a) / syms;

% history of extracted coefficients for plot
k = [];

% Previous state, for convergence check
xprev = x;

% Run till convergence
iter = 1;
while true
    
    % keep state vector in reasonable bounds
    x = x / max(abs(x));
        
    % maintain localist history of coefficients k_i for plotting
    k(:,end+1) = getk(x, a);
    
    % intersect state vector with itself
    x = intersect(x, x, p);
    
    % get distance between successive state vectors
    d = sqrt(sum((x-xprev).^2));
    
    % check convergence
    if  d < EPSILON
        break
    end
    
    % report convergence
    fprintf('%3d: %f\n', iter, d)
    
    % update
    xprev = x;
    iter = iter + 1;
    
end

% display extracted coefficient history
plot(k')

% add legend
s = cell(1,syms);
for i = 1:syms
    s{i} = num2str(i);
end
legend(s)

% avoid displaying from iteration 0
xlim([1 iter])

% label axes
xlabel('Iteration')
ylabel('Strength')




