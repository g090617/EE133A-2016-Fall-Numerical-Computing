%%
A = [1 1 ;0 0.95];
b = [0; 0.1];
%%G = zeros(40,1);
K = A^20;

for ii = 20 : -1 : 1
    if ii == 20
        G = [A^(ii-1)*b];
    else
        G = [G  A^(ii-1)*b];
    end
    
end

%%
M = [1 1;0 0.8];
s = [0;0.2];
%N = zeros(20,1);
D = M^20;

for ii = 20 : -1 : 1
    if ii == 20
        N = [M^(ii-1)*s];
    else
        N = [N  M^(ii-1)*s];
    end   
end


%%
%G = fliplr(G);
%N = fliplr(N);
C = [G(2,1:20) zeros(1,20);
    zeros(1,20) N(2,1:20);
    G(1,1:20) -N(1,1:20)];

d = [0; 
    -D(2,1); 
    D(1,1)];

x = C'*((C*C')\d);

U = x(1:20);
V = x(21:40);

%%
S = zeros(2,21);
for ii = 1 : 20
    S(1:2,ii+1) = A*S(1:2,ii) + b*U(ii); 
end

P = zeros(2,21);
P(1,1) = 1;
for ii = 1 : 20
    P(1:2,ii+1) = M*P(1:2,ii) + s*V(ii); 
end

S1 = S(1,1:21)
P1 = P(1,1:21)

line1 = plot(0:20, S(1,:), '-');
hold on
line2 = plot(0:20, P(1,:), '--');
str1 = 'S1';
str2 = 'P1';
xlabel('time')
ylabel('position')
legend(str1, str2)

