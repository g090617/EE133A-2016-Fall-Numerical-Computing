%%
num = [1 , 1.1];
den = [1 , 0 , -0.1];
[h,t]=impz(num,den);
stem(t,h);
impz(num,den)

%% Impulse response
fSampling=2000;
impz(num, den , 32,fSampling);
[h,t]=impz(num, den ,32,fSampling);

%%
[H,fVector]=freqz(num,den,1024,fSampling);
freqz(num,den,1024,fSampling)
