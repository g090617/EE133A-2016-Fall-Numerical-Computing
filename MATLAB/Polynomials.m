%%
%3.1
n = [6 11 16];
N = 1000;
x = linspace(-1, 1, N)';

for ii = 1:3
    A = zeros(n(ii),n(ii));
    t = linspace(-1, 1, n(ii))';
    temp = vander(t);
    A = fliplr(temp);
    y = 1 ./ (1 + 25*t.^2);
    coefficient = A\y;
    coe = coefficient';
    flipcoe = fliplr(coe);
    calculate = polyval(flipcoe, x);
    
    figure
    plot(x,calculate)
    
    figure
    plot(t,y)
end

%As the degree of the polynomial increases, even though
%it can still fit the given points, but it tends to go off the 
%the actual function with a higher fluctuations because 
%polynomial grows much more faster as the degree increases 

