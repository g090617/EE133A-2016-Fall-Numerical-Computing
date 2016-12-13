%%
fSampling=2000;
tSampling=1/fSampling;
t=-0.005:tSampling:0.005;
xt=rectpuls(t,0.004);
stem(t,xt);

xF=fft(xt);
nFFT=64;
xF=fft(xt,nFFT);

magXF=abs(xF);
phaseXF=angle(xF);
phaseXF=unwrap(phaseXF);

figure
stem(magXF);

figure
stem(phaseXF);

%% Frequency Shifting
magXF=fftshift(magXF);
phaseXF=fftshift(phaseXF);

figure
stem(magXF);

figure
stem(phaseXF);

%% Frequency Axis matching
fSpacing=fSampling/nFFT;
fNyquist=fSampling/2;
fStart=-fNyquist;
fEnd=fNyquist-fSpacing;
fAxis=fStart:fSpacing:fEnd;

figure
stem(fAxis,magXF);

figure
stem(fAxis,phaseXF);