%%
A=magic(3)
sum(A)
sum(A')'
sum(diag(A))
sum(diag(flipud(A)))

%%
for k=0:3
    rot90(A,k)
    rot90(A',k)
end

A=sym(A)

%%
load durer
whos

load detail 
image(X)
colormap(map)
axis image

