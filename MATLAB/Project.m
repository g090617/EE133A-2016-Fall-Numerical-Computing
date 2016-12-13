
clc;
clear all;

%setting up time line
t_range = linspace(0,40,800);
Ts = t_range(2)-t_range(1);

%Setting up impulse response h(t) and step response g1(t) on time line
A=5;
B=6;
C=5;
D=13;

T0=20;
omega0=2*pi/T0;
num1=[C D];
den1=[1 A B];
sys1=tf(num1,den1);


h1=impulse(sys1,t_range);

% impulse response after shifting to 20s
h1_20=(2*exp(-3.*(t_range-20))+3*exp(-2.*(t_range-20))).*heaviside(t_range-20);


% Compute and plot the step response g1(t) and h1(t)
g1=step(sys1, t_range);

figure;
plot(t_range,h1)
axis([0,10,0,6])
xlabel('t(sec)');
ylabel('h1(t)');
title('Graph of impulse response of h1(t)')

figure;
plot(t_range,g1)
xlabel('t(sec)');
ylabel('g1(t)');
axis([0,10,0,3])
title('Graph of step response of g1(t)')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%setting up function x(t) on time line
x1=exp(-13./5.*t_range).*(heaviside(t_range)-heaviside(t_range-10));

x2=exp(-13/5*t_range).*(heaviside(t_range)-heaviside(t_range-10))+exp(-13/5*(t_range-20)).*(heaviside(t_range-20)-heaviside(t_range-30));

%Compute and plot y1(t) through convolution function
y1=conv(x1,h1,'same')*Ts;

figure;
plot(t_range,y1)
axis([0,20,0,6])
xlabel('t(sec)');
ylabel('y1(t)');
title('Graph of y1(t)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compute and plot y2(t) through convolution function
t_range = linspace(0,40,800);
y2=conv(x2,h1_20,'same')*Ts+y1;
figure;
plot(t_range,y2)
xlabel('t(sec)');
ylabel('y2(t)');
title('Graph of y2(t)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%Setting up N range and calculate Xn and Ynm and separate N range into N
%parts
% 
% 
N_range=-10:10;
XK=zeros(1,length(N_range));
x1=exp(-13/5*N_range).*(heaviside(N_range)-heaviside(N_range-10))+exp(-13/5*(N_range-20)).*(heaviside(N_range-20)-heaviside(N_range-30));

%Calculate XK
for n=1:length(N_range)
    if(N_range(n)==0)
        XK(n)=1/52;
    else
       XK(n)=((1-exp(-26-1j*pi*(N_range(n))))/(52+1j*2*pi*(N_range(n))));
    end
end

%Plot magnitude graph
figure; stem(N_range, abs(XK)); xlabel('k'); ylabel('|X2_k|');
title(' magnitude spectra of |X2_K|')
%Plot phasor graph
figure; stem(N_range, angle(XK)); xlabel('k'); ylabel('|phase|');
title('phase spectra of X2_K')

%Calculate YK
YK=zeros(1,length(N_range));
for n=1:length(N_range)
    if(N_range(n)==0)
        YK(n)=1/24;
    else
        YK(n)=XK(n)*(2./(1j.*omega0.*(N_range(n))+3)+3/(1j.*omega0.*(N_range(n))+2));
    end
end

%Plot magnitude graph
figure; stem(N_range, abs(YK)); xlabel('k'); ylabel('|Y2_k|');
title('magnitude spectra of |Y2_K|')

%Plot phasor graph
figure; stem(N_range, angle(YK)); xlabel('k'); ylabel('|phase|');
title('phase spectra of Y2_K')

%Calculate  and plot y2(t)
y2_t=zeros(1,length(t_range));
idx = 1;
for t = t_range
    y2_t(idx) = sum(YK.* exp(1j*omega0.*N_range*t));
    idx = idx+1;
end

%Plot graph of y2_t
figure; plot(t_range, y2_t,t_range,y2); xlabel('time (sec)'); ylabel('y2(t)');
xlabel('t(sec)');
ylabel('y2(t)');
title('Graph of y2(t)')

%Compute  and plot MSE of XK from 1 to 10 harmonics 
M_range =1:10;
mse = zeros(1,length(M_range));
idx=1;
for M = M_range
    k_range = 1:1:M;
    idx2=1;
    for t = t_range
        XM_Approx(idx2) = sum(((1-exp(-26-1j.*pi.*(k_range)))/(52+1j.*2.*pi.*(k_range))).*exp(1j.*omega0.*k_range.*t));
        idx2 = idx2+1;
    end
    dt = t_range(2)-t_range(1);
    mse(idx) = 1/T0 * sum(abs(x2-XM_Approx).^2)*dt;
    idx = idx+1;
end

figure; plot(M_range, mse, 'linewidth',3);
xlabel('n');
ylabel('MSE');
title('Graph of MSE of X2_n')


%Compute and plot MSE of YK from 1 to 10 harmonics
M_range = [1,2,3,4,5,6,7,8,9,10];
mse = zeros(1,length(M_range));
idx=1;
for M = M_range
    % compute yM_approx
    k_range = 1:1:M;
    idx2=1;
    for t = t_range
        temp=(2./(1j.*omega0.*(k_range)+3)+3./(1j.*omega0.*(k_range)+2));
        YM_Approx(idx2) = sum((2./(1j.*omega0.*(k_range)+3)+3./(1j.*omega0.*(k_range)+2)).*((1-exp(-26-1j*pi*(k_range)))/(52+1j*2*pi*(k_range))).*exp(1j.*omega0.*k_range.*t));
        idx2 = idx2+1;
    end
    % compute MSE
    dt = t_range(2)-t_range(1);
    mse(idx) = 1/T0 * sum(abs(y2-YM_Approx).^2)*dt;
    idx = idx+1;
end
figure; plot(M_range, mse, 'linewidth',3);
xlabel('n');
ylabel('MSE');
title('Graph of MSE of Y2_n')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Setting up frequncy domain
w_range = linspace(-10,10,100);

%Setting up fourier transform of x1 and h1
X1_w=(1./(13./5+1j.*w_range)).*(1-exp(-26+1j.*10.*w_range));
H1_w=(1j.*5.*w_range+13)./((1j.*w_range+3).*(1j.*w_range+2));

% Plot magnitude spectra of |X1(w)| over frequency domain
figure;
plot(w_range,abs(X1_w))
xlabel('\omega');
ylabel('|X1(\omega)|');
title('magnitude spectra of |X1(\omega)| over frequency domain');

% Plot phase spectra of X1(w) over frequency domain
figure;
plot(w_range,angle(X1_w))
xlabel('\omega');
ylabel('|X1(\omega)|');
title('phase spectra of \angle X1(\omega) over frequency domain');

% Plot magnitude spectra of |H1(w)| over frequency domain
figure;
plot(w_range,abs(H1_w))
xlabel('\omega');
ylabel('|H1(\omega)|');
title('magnitude spectra of |H1(\omega)| over frequency domain');

% Plot phase spectra of H1(w) over frequency domain
figure;
plot(w_range,angle(H1_w))
xlabel('\omega');
ylabel('\angle H1(\omega)');
title('phase spectra of \angle H1(\omega) over frequency domain');

% Plot magnitude spectra |Y1(w)| over frequency domain
figure;
plot(w_range,abs(H1_w.*X1_w))
xlabel('\omega');
ylabel('|Y1(\omega)|');
title('magnitude spectra of |Y1(\omega)| over frequency domain');

% Plot phase spectra of Y1(w) over frequency domain
figure;
plot(w_range,angle(H1_w.*X1_w))
xlabel('\omega');
ylabel('\angle Y1(\omega)');
title('phase spectra of \angle Y1(\omega) over frequency domain');