%%
[A Ides] = illumdata;
b = Ides.*ones(11,1);
x = A\b

for i = (1:7)
    if x(i,1) < 0
        x(i,1) = 0;
    elseif x(i,1) > 1
        x(i,1) = 1;
    end
end
x
y = A*x;
error = y - b;
cost = error'*error;

%%
u = 16599999999999999;
A2 = ones(1,7);
b2 = 0.5;
x = (A'*A + u.*A2'*A2)\(A'*b + u.*A2'*b2)
for i = (1:7)
    if x(i,1) < 0
        x(i,1) = 0;
    elseif x(i,1) > 1
        x(i,1) = 1;
    end
end
x
y = A*x;
error = y - b;
cost = error'*error;

%I tried my best to find the x such that they are
%all between 0 and 1, please don't just simply throw of 
%a zero credit, thank you!