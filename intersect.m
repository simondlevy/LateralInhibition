function z = intersect(x, y, d)
% Z = INTERSECT(X, Y, D) where D is a permutation dictionary

w  = d.w;
p1 = d.p1;
p2 = d.p2;

z = zeros(size(x));

for k = 1:size(w, 1)
    z = z + x(p1(k,:)) .* y(p2(k,:)) .* w(k,:);
end

z = z / size(w, 1);





