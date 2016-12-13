%%
load tomography.mat

x = zeros(784,1);
Error = 0;
for kk = 1:10
    for ii = 1:576
        x = x - (((A(ii,:)*x - b(ii,1))/(norm(A(ii,:))^2)).*A(ii,:))';
    end
    Error = norm(A*x - b)/norm(b);
end
imshow(reshape(x,28,28));