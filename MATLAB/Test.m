clc;
clear all;
X0 = 0.5;
k_range = -40:40;

Xk = zeros(1,length(k_range));

for k = 1:length(k_range)
    if(k_range(k)==0)
        Xk(k) = 0.5; % DC component
    else
        Xk(k) = exp(-13/5*k_range(k))*(heaviside(k_range(k))-heaviside(k_range(k)-10)).* exp(-1j*k_range(k)*pi/10);
    end
end

% plot magnitude line spectrum
figure; stem(k_range, abs(Xk)); xlabel('k'); ylabel('|X_k|');


T0 = 20;
w0 = pi/10;
t_range = linspace(0,2*T0,1000);
Ts = t_range(2)-t_range(1);
x_t_hat = zeros(1,length(t_range));

idx = 1;
for t = t_range
    x_t_hat(idx) = sum(Xk.* exp(1j*pi/10.*k_range*t));
    idx = idx+1;
end

x_t_hat(1)
x_t_hat(2)
figure; plot(t_range, x_t_hat); xlabel('time (sec)'); ylabel('x(t)');