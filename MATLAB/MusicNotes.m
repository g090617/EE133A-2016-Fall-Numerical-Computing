%%
fSampling=40000;

%%Create time vector
tSampling=1/fSampling;
t=0:tSampling:0.5;

%%Set of note frequencies
fNote=[ 524 588 660 698 784 880 988];

%%Generate notes
Para=2*pi.*(fNote);
Do=sin(Para(1)*t+2*pi*rand);
Re=sin(Para(2)*t+2*pi*rand);
Mi=sin(Para(3)*t+2*pi*rand);
Fa=sin(Para(4)*t+2*pi*rand);
So=sin(Para(5)*t+2*pi*rand);
La=sin(Para(6)*t+2*pi*rand);
Ti=sin(Para(7)*t+2*pi*rand);

%%weight notes
expWtCnst=6;
expWt=exp(-abs(expWtCnst*t));
Do=Do.*expWt;
Re=Re.*expWt;
Mi=Mi.*expWt;
Fa=Fa.*expWt;
So=So.*expWt;
La=La.*expWt;
Ti=Ti.*expWt;

%%Generate note sequence
NoteSequence=[Do Re Mi Fa So La Ti];

%%Listen to Notes
soundsc(NoteSequence, fSampling)

%%
r=audiorecorder;
disp('start record');
recordblocking(r,5);
disp('stop record');
