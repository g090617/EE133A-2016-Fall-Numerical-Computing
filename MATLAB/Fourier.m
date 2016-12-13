T0=2;
N=41;
Ts=0.01;
t=-40:Ts:40;
x=heaviside(t)-heaviside(t-1);
omega0=2*pi/T0;

for n = 1:N
	F(n) = 1/T0*sum(x.*exp(-1j*omega0*(n-1)*t))*Ts;
    X(n)=subs(F(n));
    w(n)=(n-1)*2*pi/T0;
end

conj(fliplr(X(2:N)));
X_n=[conj(fliplr(X(2:N))) X];
w_n=[-fliplr(w(2:N)) w];

stem(w_n,abs(X_n));axis([-40 40 -0.1 0.5]);

