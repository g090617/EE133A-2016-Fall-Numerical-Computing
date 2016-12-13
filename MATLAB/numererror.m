%%
k = [6 7 8];
display('with QR');
for i = 1 : 3
    A = [1 1; 10^(-k(i)) 0; 0 10^(-k(i))];
    b = [-10^(-k(i)); 1+10^(-k(i)); 1-10^(-k(i))];
    x = A\b
end

display('without QR');

for i = 1 : 3
    A = [1 1; 10^(-k(i)) 0; 0 10^(-k(i))];
    b = [-10^(-k(i)); 1+10^(-k(i)); 1-10^(-k(i))];
    x = (A'*A)\(A'*b)
end