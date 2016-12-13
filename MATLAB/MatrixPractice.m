%%
n = 2000;
u = rand(n,1); v = rand(n,1); x = rand(n,1);
t1 = cputime; y1 = (eye(n) + u*v')*x; t1 = cputime - t1;
t2 = cputime; y2 = x + (v'*x)*u; t2 = cputime - t2;
t1
t2
y1(1)
y2(1)
