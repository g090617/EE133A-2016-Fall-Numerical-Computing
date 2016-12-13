%%
%3.6
a = [-10; -10; 10];
b = [10; 0; 0];
c = [-10; 10; 0];
d = [-20; -10; -10];


ra = 18.187;
rb = 9.4218;
rc = 14.310;
rd = 24.955;

dist_square = [ra rb rc rd].^2;
norm_square = [a'*a b'*b c'*c d'*d];

dist_norm_diff = dist_square - norm_square;

result = zeros(3,1);

for ii = 2:4
    result(ii - 1) = dist_norm_diff(1) - dist_norm_diff(ii);
end

result = 0.5.*result;
A = [b-a c-a d-a]';
x = A\result



