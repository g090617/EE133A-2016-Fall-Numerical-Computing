%%
E = [5 15 4];
R = [1 3 0.5];

for jj = 1 : 3
    
    x = 0;
    
    t = linspace(0,4,100);
    y = t.^3 - 6.*t.^2 + 10.*t - (E(jj) - t) / R(jj);
    
    figure
    plot(t,y)
    %f(x) = x^3 - 6*x^2 + 10*x - (E - x) / R
    %f'(x) = 3*x^2 - 12*x + 10 + 1/R
    
    y = x^3 - 6*x^2 + 10*x - (E(jj) - x) / R(jj);
    dy = 3*x^2 - 12*x + 10 + 1/R(jj);
    ii = 0;
    yy_array = zeros(1,20);
    k = ones(1,20);
    while( abs(y) > 10^(-8) )
        x_temp = x - (dy)^(-1) * y;
        y_temp = y + dy*(x_temp - x);
        x = x_temp;
        y = x^3 - 6*x^2 + 10*x - (E(jj) - x) / R(jj);
        dy = 3*x^2 - 12*x + 10 + 1/R(jj);
        ii = ii + 1;
        k(ii) = ii;
        yy_array(ii) = abs(y);
    end
    figure
    plot(k(1:ii),yy_array(1:ii))
    
end