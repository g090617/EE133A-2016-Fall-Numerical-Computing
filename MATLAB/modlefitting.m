%%
%affine 2-tap
display('affine 2-tap')
[u,y] = systemid;
t = linspace(1,1,99)';

A = [ones(99,1) u(2:100) u(1:99)];
b = y(2:100);
x = A\b;

y_hat = A*x;
figure
bar(y_hat,'w');
title('Plot for $$\hat{y}$$','interpreter','Latex')

figure
plot(y_hat)
hold on
plot(y(2:100))
title('Plot for $$\hat{y}$$ and y','interpreter','Latex')

r = y_hat - b;
figure
bar(r,'w');
title('Graph for residual')
Rrms = sqrt(r'*r/99);

figure
plot(r)
title('Graph for residual')
Rrms = sqrt(r'*r/99)
%%
display('quadratic 2-tap')
A = [ones(99,1) u(2:100) u(2:100).^2 u(1:99) u(1:99).^2 u(2:100).*u(1:99)];
b = y(2:100);
x = A\b;

y_hat = A*x;
figure
bar(y_hat,'w');
title('Plot for $$\hat{y}$$','interpreter','Latex')

figure
plot(y_hat,'-')
hold on
plot(y(2:100),'--')
title('Plot for $$\hat{y}$$ and y','interpreter','Latex')

r = y_hat - b;
figure
bar(r,'w');
title('Graph for residual')
Rrms = sqrt(r'*r/99)

figure
plot(r)
title('Graph for residual')
Rrms = sqrt(r'*r/99)