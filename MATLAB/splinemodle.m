%%
splinefit;
plot(t,y,'o');
zeros(100,4);
T1 = t(1 : 50);
T2 = t(51 : 100);

A = [ones(50,1) T1 T1.^2 T1.^3 zeros(50,4);
    zeros(50,4) ones(50,1) T2 T2.^2 T2.^3];

b = y;
 
C = [1 0 0 0 -1 0 0 0;
    0 1 0 0 0 -1 0 0];
 
d = [ 0; 0];

H = A'*A;
sol = [H C';C zeros(2,2)]\[A'*b ; d]
x = sol(1:8)

result = A*x;

hold on
plot(t,result,'o')