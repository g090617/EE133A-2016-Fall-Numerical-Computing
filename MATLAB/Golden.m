%%phi=(1+sqrt(5))/2

format long 
phi

p=[1 -1 -1]
r=roots(p)

syms x
r=solve(1==x^2-x)

pretty(r)

phi=r(2)
vpa(phi,50)

f=@(x) 1./x-(x-1)
ezplot(f,0,4)
phi=fzero(f,1)

hold on
plot(phi,0,'o')

%%
phi=(1+sqrt(5))/2;
x=[0 phi phi 0 0];
y=[0 0 1 1 0]
u=[1 1];
v=[0 1];

plot(x,y,'b',u,v,'b--')
text(phi/2,1,.05,'\phi')
text((1+phi)/2,-.05,'\phi-1')
text(-.05,.5,'1')
text(.5,-.05,'1')
axis equal
axis off
set(gcf,'color','white')


%%
GoldFract(6)
F=imread('fern.png');
image(F)