function d = permdict(a, siz)
% D = PERMDICT(A, [SIZ])
%   SIZ defaults to 1


if nargin < 2
    siz = 1;
end

dims = size(a, 2);

w = zeros(siz, dims);

p1 = zeros(siz, dims);
p2 = zeros(siz, dims);

for k = 1:siz
    p1(k,:) = randperm(dims);
    p2(k,:) = randperm(dims);
    for j = 1:size(a,1)
        x = a(j,:);
        w(k,:) = w(k,:) + x .* x(p1(k,:)) .* x(p2(k,:));
    end
end

d.w  = w;
d.p1 = p1;
d.p2 = p2;

