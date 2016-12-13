%%
n = 10;
a = randn(n,1);
b = randn(n,1);
A = toeplitz(a, [a(1),flipud(a(2:n))']);
x = ifft(fft(b)./fft(a));
