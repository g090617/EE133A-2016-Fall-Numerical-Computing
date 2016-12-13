%%
F0=262;
A=2;
phi=pi/4;
fSampling=8000;
tSampling=1/fSampling;
t=-0.005:tSampling:0.005;

xt=A*sin(2*pi*F0*t+phi);
stem(t,xt)

hold on
plot(t,xt)

xtDown=downsample(xt,4);
tDown=downsample(t,4);
hold on
stem(tDown,xtDown,'y')

%%
yt=A*sawtooth(2*pi*F0*t);
figure
stem(t,yt)
hold on 
plot(t,yt)
%%
zt=A*sinc(2*F0*t);
figure
stem(t,zt)
hold on
plot(t,zt)
%%
gNoise=randn(1,1e6);
hist(gNoise,100)
