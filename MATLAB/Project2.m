syms t s y(t) Y x(t) X H h(t) g1(t) G1 x1(t) X1 y1(t) Y1;

% Laplace Transform of Y(s)
u=diff(y(t),2)+5*diff(y(t))+6*y(t);
U=laplace(u,t,s);

% Laplace Transform of X(s)
w=5*diff(x(t))+13*x(t);
W=laplace(w,t,s);

% Laplace Transform of unit step function
f=heaviside(t);
F=laplace(f,t,s);

% Laplace Transform of x1(t)
z=exp(-13/5*t)*(heaviside(t)-heaviside(t-10));
Z=laplace(z,t,s)

eqn_X=subs(W,{'laplace(x(t),t,s)','x(0)','D(x)(0)'},{1,0,0});
eqn_X

eqn_Y=subs(U,{'laplace(y(t),t,s)','y(0)','D(y)(0)'},{1,0,0});
eqn_Y

% Laplace Transform of Impulse Response
H=eqn_X/eqn_Y

Y1=H*Z
y1(t)=ilaplace(Y1,s,t)
% Inverse Laplace Transform of Impulse Response
h(t)=ilaplace(H,s,t)