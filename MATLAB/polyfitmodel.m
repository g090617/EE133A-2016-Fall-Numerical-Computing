%%
[t,y] = polyfit;
scatter(t,y)

F = [ones(25,1) t t.^2 t.^3];
DF = [zeros(25,1) ones(25,1) 2.*t 3.*t.^2];

A = [ones(25,1) t t.^2 t.^3];
C_init = A\y

N = length(t);
m = 50;
n = 4;
u = t;
x = [C_init; u];
for k = 1 : 50
    D = fliplr(vander(u));
    D = D(:,1:n);
    r = [D*C_init - y;u-t];
    d = zeros(N,1);
    for i = 2 : n
        d = d + (i -1)*C_init(i)*u.^(i-2);
    end
    A = [D,diag(d); zeros(N,n), eye(N)];
    if(norm(A'*r)<1e-6)
        break;
    end;
    x = x - A\r;
    C_init = x(1:n);
    u = x(n+1:n+N);
end
C_init
t = linspace(0.1,1,50)';
F = [ones(50,1) t t.^2 t.^3];
result = F*C_init;


hold on
plot(t,result')

