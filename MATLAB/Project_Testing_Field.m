%% 

%% Square pulse from Hw 6 Pr. 2
% square pulse y has a peroid of 2
t_range = linspace(0,6,6000);
y = [ones(1,1000), -1* ones(1,1000), ones(1,1000), -1*ones(1,1000), ones(1,1000), -1*ones(1,1000) ]; % actual y(t)

figure; plot(t_range,y, 'linewidth',2);
grid on;


%% approximation using Fourier series% 
% y = 4* sum_k sin(pi k t)/(pi k); for odd k
% y_approx = 4 * sum_k sin(pi k t)/(pi k); for k = 1,3,5,...M
M = 5; % number of harmonics used in approximation
k_range = 1:2:M;
yM_approx = zeros(1,length(t_range));

idx = 1;
for t = t_range
    yM_approx(idx) = 4* sum(sin(pi*k_range*t)./(pi*k_range));    
    idx = idx+1;
end


hold all; plot(t_range, yM_approx,  'linewidth', 2);


M = 15; % number of harmonics used in approximation
k_range = 1:2:M;
yM_approx = zeros(1,length(t_range));

idx = 1;
for t = t_range
    yM_approx(idx) = 4* sum(sin(pi*k_range*t)./(pi*k_range));    
    idx = idx+1;
end


hold all; plot(t_range, yM_approx, 'linewidth', 2);
ylabel('y(t)','Fontsize',14);
xlabel('t','Fontsize',14);
title(['Square pulse approximation with M = ' num2str(M) ' harmonics']);
legend('Actual signal y(t)','Approximation with M = 5 harmonics', 'Approximation using M = 15 harmonics');


%% compute MSE if y is approximated using M harmonics
M_range = [1,3,5,7,9];
mse = zeros(1,length(M_range));
idx=1;
T0 = 2;
for M = M_range
    % compute yM_approx
    k_range = 1:2:M;
    idx2=1;
    for t = t_range
        yM_approx(idx2) = 4* sum(sin(pi*k_range*t)./(pi*k_range));
        yM_approx(idx2)
        idx2 = idx2+1;
    end
    size(yM_approx)
    size(y)
    % compute MSE
    dt = t_range(2)-t_range(1);
    mse(idx) = 1/T0 * sum(abs(y-yM_approx).^2)*dt;
    idx = idx+1;
end

figure; plot(M_range, mse, 'linewidth',3);
title('MSE in approximation of y using M harmonics');
ylabel('MSE','Fontsize',14);
xlabel('M','Fontsize',14);
grid on;