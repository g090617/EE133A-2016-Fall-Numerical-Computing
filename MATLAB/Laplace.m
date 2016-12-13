

A=5;
B=6;
C=5;
D=13;

Ts=0.01;
t=[0.0:Ts:10]; 
num1=[C D];
den1=[1 A B];
sys1=tf(num1,den1);
h1=impulse(sys1, t);
figure;
plot(t, h1)
figure;
plot(t,1)

x1 =exp(-13/5.*t).*(heaviside(t)-heaviside(t-10));
y1=conv(x1,h1)*Ts;
t= linspace(0,10,length(y1));
figure;
 plot(t,y1)
 axis([0,20,0,1])
xlabel('t(sec)');
ylabel('y1(t)');
title('Graph of y1(t)')
%  
%  clear all;
 
%  syms t;
%  A=5;
% B=6;
% C=5;
% D=13;
% 
% Ts=0.01;
% t=[0.0:Ts:40];
% x2=exp(-13/5*t).*(heaviside(t)-heaviside(t-10))+exp(-13/5*(t-20)).*(heaviside(t-20)-heaviside(t-30));
% num1=[C D];
% den1=[1 A B];
% sys1=tf(num1,den1);
% h1=step(sys1, t);
% y2=conv(x2,h1)*Ts;
% t= linspace(0,40,length(y2));
% plot(t,y2)

% t= linspace(0,40,length(x2));
% plot(t,x2)
 
%  *(heaviside(t)-heaviside(t-10)+heaviside(t-20)-heaviside(t-30))
 
 clear all;
 clc;
 syms t;
 T0=20;
 N=41;
 Ts=0.001;
 t=0:Ts:40;
 omega0=2*pi/T0;
 
 A=5;
 B=6;
 C=5;
 D=13;

num1=[C D];
den1=[1 A B];
H1=tf(num1,den1);
h1=step(H1, t);

[mag,phase] = bode( H1, imag(1j*omega0));

x2=exp(-13/5*t).*(heaviside(t)-heaviside(t-10));
% plot(x2)



for n = 1:N
	XK(n) = 1/(T0)*sum(x2.*exp(-1j*omega0*(n-1)*t)*Ts)
end

% 
% for n=1:N
%     YK(n)=XK(n)*(2/(1j*omega0*(n-1)+3)+3/(1j*omega0*(n-1)+2));
% end
% 
% 
% index=1;
% for n=1:N
%     y_t(index)=sum(XK(n).*exp(1j*(n-1)*omega0*t));
%     y_t(n);
%     index=index+1;
% end


% YK(1).*exp(1j*(2-1)*omega0*t)
% % cos((n-1)*omega0*t)+1j*sin((n-1)*omega0*t*10)

% xk2=0.5*(1/(-26-1j*1*pi))*(exp(-26-1j*1*pi)-1)
% 
% xk1-xk2
% 
% hk1=(2/(1j*omega0*(2-1)+3)+3/(1j*omega0*(2-1)+2))
% 
% hk2=(((1j*1*pi)/2)+13)/(-(pi*pi*1/100)+(1j*pi*1)/2+6)
% 
% yk1=xk1*hk1
% 
% yk2=xk2*hk2
% 
% sum1=sum(yk1.*exp(1j*(2-1)*omega0*t))
% 
% sum2=sum(yk2.*exp(1j*(2-1)*omega0*t))

% y_t= zeros(1,length(N));
% 
% for n=1:N
%     y_t=sum(YK(n).*exp(1j*(n-1)*omega0*t));
% end
% 
% 
% idx = 1;
% for n=1:N
%     for t = 0:40
%         y_t(idx) = sum(YK(n).* exp(1j*omega0*n*t));
%         idx = idx+1;
%     end
% end




% figure; plot(40, y_t); xlabel('time (sec)'); ylabel('x(t)');


% y2=conv(x2,h1)*Ts;
% t= linspace(0,40,length(y2));
% plot(t,y2)





% plot(t,y_t)

% 
% 1/T0*sum(x2.*exp(-1j*omega0*(2-1)*t))*Ts
% 
% (0.5*1/(-26+1j*1*pi))*(exp(-26-1j*1*pi)-1)

% for n=1:N
%     YK(n)=
% end






% 0.5*(1/(-26))*(exp(-26)-1)*(13)/(6)

% for n=1:N
%     YK(n)=0.5*(1/(-26+1j*n*pi))*(exp(-26-1j*n*pi)-1)*((1j*n*pi/2+13)/(-(n^2)*(pi^2)/100+(1j*n*pi/2)+6))
% end

% 0.2*(1/(-26))*(exp(-26)-1)*(2/(1j*n*(pi/10))+3/(1j*n*(pi/10)+2))

% for n = 1:N
% 	F(n) = 1/T0*sum(x2.*exp(-1j*omega0*(n-1)*t))*Ts;
%     X(n)=subs(F(n));
%     w(n)=(n-1)*2*pi/T0;
% end

% for n = 1:N
%     Y(n)=mag*exp(j*n*phase)*XK(n);
% end

% for n = 1:N
%     y2=sum(YK(n)*exp(1j*omega0*(n-1)*t));
% end

